import 'dart:io';

import 'package:corona_virus_app/app/repositories/data_repositories.dart';
import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/endPointData.dart';
import 'package:corona_virus_app/app/ui/endPoint_card.dart';
import 'package:corona_virus_app/app/ui/last_updated_status_date.dart';
import 'package:corona_virus_app/app/ui/showAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _cases;
  EndPointsData _endPointData;

  @override
  void initState() {
    super.initState();
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    _endPointData = dataRepository.getAllEndPointsCachedData();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);

      // final cases = await dataRepository.getEndPointData(EndPoint.cases);

      final endPointData = await dataRepository.getAllEndPointData();
      setState(() {
        // _cases = cases;
        _endPointData = endPointData;
      });
    } on SocketException catch (_) {
      showAlerDilog(
          context: context,
          title: 'Conttection Error',
          content: "Could Not retrive data,Please try again later.",
          defaultActionText: "ok");
      // print(e);
    } catch (_) {
      showAlerDilog(
          context: context,
          title: 'Uknown Error',
          content: "Please Contact support or try again later",
          defaultActionText: "ok");
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedFormatedVariable(
        lastUpdated: _endPointData != null
            ? _endPointData.values[EndPoint.cases]?.date
            : null);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Corona Virus Tracker"),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            // LastUpdatedStatusText(
            //   text: _endPointData != null
            //       ? _endPointData.values[EndPoint.cases].date?.toString() ?? ''
            //       : '',
            // ),
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(),
            ),
            for (var endPoint in EndPoint.values)
              EndPointCard(
                endPoint: endPoint,
                value: _endPointData != null
                    ? _endPointData.values[endPoint]?.value
                    : null,
              )
          ],
        ),
      ),
    );
  }
}
