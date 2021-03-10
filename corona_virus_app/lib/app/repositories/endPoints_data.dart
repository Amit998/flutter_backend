// class EndPointData {
//   final int cases;
//   final int casesSuspected;
//   final int casesConfirmed;
//   final int deaths;
//   final int recovered;

// }

import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/endPointData.dart';
import 'package:flutter/cupertino.dart';

class EndPointsData {
  final Map<EndPoint, EndpointData> values;

  EndPointsData({@required this.values});

  EndpointData get cases => values[EndPoint.cases];
  EndpointData get casesSuspected => values[EndPoint.casesSuspected];
  EndpointData get casesConfirmed => values[EndPoint.casesConfirmed];
  EndpointData get deaths => values[EndPoint.deaths];
  EndpointData get recovered => values[EndPoint.recovered];

  @override
  String toString() =>
      ' cases: $cases ,casesSuspected: $casesSuspected ,casesConfirmed: $casesConfirmed ,deaths: $deaths ,recovered: $recovered  ';
}
