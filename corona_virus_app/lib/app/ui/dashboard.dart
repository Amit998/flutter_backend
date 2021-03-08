import 'package:corona_virus_app/app/repositories/data_repositories.dart';
import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/ui/endPoint_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _cases;
  EndPointData _endPointData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    // final cases = await dataRepository.getEndPointData(EndPoint.cases);

    final endPointData = await dataRepository.getAllEndPointData();

    setState(() {
      // _cases = cases;
      _endPointData = endPointData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Corona Virus Tracker"),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            for (var endPoint in EndPoint.values)
              EndPointCard(
                endPoint: endPoint,
                value: _endPointData != null
                    ? _endPointData.values[endPoint]
                    : null,
              )
          ],
        ),
      ),
    );
  }
}
