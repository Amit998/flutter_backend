import 'package:corona_virus_app/app/services/api_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum EndPoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandBox() => API(apiKey: APIKeys.ncovSandBox);

  static final String host = 'ncov2019-admin.firebaseapp.com';
  // static final String host = 'apiw.nubentos.com';
  // static final String host = 'apiw.nubentos.com';
  static final String basePath = 't/nubentos.com/ncovapi/1.0.0';
  static final int port = 443;

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
        // queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endPointUri(EndPoint endPoint) => Uri(
      scheme: 'https',
      host: host,
      port: port,
      // path: '$basePath/${_paths[endPoint]}'
      path: _paths[endPoint],
      );

  static Map<EndPoint, String> _paths = {
    EndPoint.cases: 'cases',
    EndPoint.casesSuspected: 'casesSuspected',
    EndPoint.casesConfirmed: 'casesConfirmed',
    EndPoint.deaths: 'deaths',
    EndPoint.recovered: 'recovered'
  };
}
