import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/endPointData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class DataCachedService {
  DataCachedService({@required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  static String endPointvalueKey(EndPoint endPoint) => '$endPoint/value';
  static String endPointDateKey(EndPoint endPoint) => '$endPoint/date';

  EndPointsData getData() {
    Map<EndPoint, EndpointData> values = {};

    EndPoint.values.forEach((endPoint) {
      final value = sharedPreferences.getInt(endPointvalueKey(endPoint));
      final dateString = sharedPreferences.getString(endPointDateKey(endPoint));

      if (value != null && dateString != null) {
        final date = DateTime.tryParse(dateString);

        values[endPoint] = EndpointData(value: value, date: date);
      }
    });

    return EndPointsData(values: values);
  }

  Future<void> setData(EndPointsData endPointsData) async {
    endPointsData.values.forEach((endPoint, endPointData) async {
      await sharedPreferences.setInt(
          endPointvalueKey(endPoint), endPointData.value);
      await sharedPreferences.setString(
          endPointDateKey(endPoint), endPointData.date.toIso8601String());
    });
  }
}
