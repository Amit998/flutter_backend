import 'package:corona_virus_app/app/repositories/data_repositories.dart';
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
  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final cases = await dataRepository.getEndPointData(EndPoint.cases);
    setState(() {
      _cases = cases;
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
            EndPointCard(
              endPoint: EndPoint.cases,
              value: _cases,
            )
          ],
        ),
      ),
    );
  }
}
