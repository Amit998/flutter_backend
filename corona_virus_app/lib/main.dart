import 'package:corona_virus_app/app/repositories/data_repositories.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/api_service.dart';
import 'package:corona_virus_app/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  // Intl.defaultLocale = 'en_GB';
  // await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(
          API.sandBox(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF101010),
            cardColor: Color(0xFF2222222)),
        home: Dashboard(),
      ),
    );
  }
}
