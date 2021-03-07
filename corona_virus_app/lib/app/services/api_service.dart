import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'api.dart';
import 'package:http/http.dart' as http;

class APIService {
  final API api;
  APIService(this.api);

  Future<String> getAccessToken() async {
    final response = await http.post(api.tokenUri().toString(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  Future<int> getEndpointData({
    @required String accessToken,
    @required EndPoint endPoint,
  }) async {
    final uri = api.endPointUri(endPoint);
    final response = await http.get(
      uri.toString(),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    // print(response.statusCode);
    // print('Hello');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // print(data);

      if (data.isNotEmpty) {
        final Map<String, dynamic> endPointData = data[0];
        final String responseJsonKey = _responseJsonKeys[endPoint];

        final int result = endPointData[responseJsonKey];

        print(responseJsonKey);

        // final int result = endPointData['data'];

        // print(endPointData['data']);
        print(result);
        if (result != null) {
          return result;
        }
      }
    }
    print(
        'Request $uri faild\nResponse ${response.statusCode} ${response.reasonPhrase} ${response.body} ');
    throw response;
  }

  static Map<EndPoint, String> _responseJsonKeys = {
    EndPoint.cases: 'cases',
    EndPoint.casesSuspected: 'data',
    EndPoint.casesConfirmed: 'data',
    EndPoint.deaths: 'data',
    EndPoint.recovered: 'data',
  };
}
