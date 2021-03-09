import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedFormatedVariable {
  final DateTime lastUpdated;

  LastUpdatedFormatedVariable({@required this.lastUpdated});

  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formated = formatter.format(lastUpdated);

      return 'Last Updated $formated';
    }

    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  final String text;

  const LastUpdatedStatusText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
