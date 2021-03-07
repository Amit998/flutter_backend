import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../services/api_service.dart';

class DataRepository {
  final APIService apiService;

  DataRepository({@required this.apiService});

  String _accessToken;

  Future<int> getEndPointData(EndPoint endPoint) async =>
      await _getDataRefrestingToken(
        onGetData: () => apiService.getEndpointData(
            accessToken: _accessToken, endPoint: endPoint),
      );

  Future<EndPointData> getAllEndPointData() async =>
      await _getDataRefrestingToken<EndPointData>(
        onGetData: _getAllEndPointData,
      );

  Future<T> _getDataRefrestingToken<T>({Future<T> Function() onGetData}) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }

      return await onGetData();
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await onGetData();
      }
      rethrow;
    }
  }

  Future<EndPointData> _getAllEndPointData() async {
    final values = await Future.wait([
      apiService.getEndpointData(
          accessToken: _accessToken, endPoint: EndPoint.cases),
      apiService.getEndpointData(
          accessToken: _accessToken, endPoint: EndPoint.casesConfirmed),
      apiService.getEndpointData(
          accessToken: _accessToken, endPoint: EndPoint.casesSuspected),
      apiService.getEndpointData(
          accessToken: _accessToken, endPoint: EndPoint.deaths),
      apiService.getEndpointData(
          accessToken: _accessToken, endPoint: EndPoint.recovered),
    ]);

    return EndPointData(values: {
      EndPoint.cases: values[0],
      EndPoint.casesSuspected: values[1],
      EndPoint.casesConfirmed: values[2],
      EndPoint.deaths: values[3],
      EndPoint.recovered: values[4],
    });
  }
}
