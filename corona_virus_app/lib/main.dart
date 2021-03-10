import 'package:corona_virus_app/app/repositories/data_repositories.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/api_service.dart';
import 'package:corona_virus_app/app/services/data_cache.dart';
import 'package:corona_virus_app/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Intl.defaultLocale = 'en_GB';
  // await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
          apiService: APIService(
            API.sandBox(),
          ),
          dataCachedService:
              DataCachedService(sharedPreferences: sharedPreferences)),
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
