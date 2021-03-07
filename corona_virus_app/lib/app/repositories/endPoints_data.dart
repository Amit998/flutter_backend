// class EndPointData {
//   final int cases;
//   final int casesSuspected;
//   final int casesConfirmed;
//   final int deaths;
//   final int recovered;

// }

import 'package:corona_virus_app/app/services/api.dart';
import 'package:flutter/cupertino.dart';

class EndPointData {
  final Map<EndPoint, int> values;

  EndPointData({@required this.values});

  int get cases => values[EndPoint.cases];
  int get casesSuspected => values[EndPoint.casesSuspected];
  int get casesConfirmed => values[EndPoint.casesConfirmed];
  int get deaths => values[EndPoint.deaths];
  int get recovered => values[EndPoint.recovered];

  String toString() =>
      ' cases: $cases ,casesSuspected: $casesSuspected ,casesConfirmed: $casesConfirmed ,deaths: $deaths ,recovered: $recovered  ';
}
