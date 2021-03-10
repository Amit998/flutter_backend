import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/data_cache.dart';
import 'package:corona_virus_app/app/services/endPointData.dart';
import 'package:corona_virus_app/app/ui/endPoint_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../services/api_service.dart';

class DataRepository {
  final APIService apiService;
  final DataCachedService dataCachedService;

  DataRepository({this.dataCachedService, @required this.apiService});

  String _accessToken;

  Future<EndpointData> getEndPointData(EndPoint endPoint) async =>
      await _getDataRefrestingToken<EndpointData>(
        onGetData: () => apiService.getEndpointData(
            accessToken: _accessToken, endPoint: endPoint),
      );

  EndPointsData getAllEndPointsCachedData() => dataCachedService.getData();
  // Check

  // EndPointsData getAllEndpointsCachedData() => dataCacheService.getData();

  Future<EndPointsData> getAllEndPointData() async {
    final endpointsData = await _getDataRefrestingToken<EndPointsData>(
      onGetData: _getAllEndPointData,
    );
    await dataCachedService.setData(endpointsData);
    return endpointsData;
  }

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

  Future<EndPointsData> _getAllEndPointData() async {
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

    return EndPointsData(values: {
      EndPoint.cases: values[0],
      EndPoint.casesSuspected: values[1],
      EndPoint.casesConfirmed: values[2],
      EndPoint.deaths: values[3],
      EndPoint.recovered: values[4],
    });
  }
}
