import 'package:corona_virus_app/app/repositories/endPoints_data.dart';
import 'package:corona_virus_app/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class EndPointCardData {
  final String title;
  final String assetName;
  final Color color;

  EndPointCardData(this.title, this.assetName, this.color);
}

class EndPointCard extends StatelessWidget {
  final EndPoint endPoint;
  final int value;

  static Map<EndPoint, EndPointCardData> _cardsData = {
    EndPoint.cases:
        EndPointCardData('cases', 'assets/count.png', Color(0xFFFFF492)),
    EndPoint.casesSuspected: EndPointCardData(
        'Suspected Cases', 'assets/suspect.png', Color(0xFFEEDA28)),
    EndPoint.casesConfirmed: EndPointCardData(
        'casesConfirmed', 'assets/sick.png', Color(0xFFE99600)),
    EndPoint.deaths:
        EndPointCardData('deaths', 'assets/Scavenger.png', Color(0xFFE40000)),
    EndPoint.recovered:
        EndPointCardData('recovered', 'assets/patient.png', Color(0xFF70A901)),
  };

  const EndPointCard({Key key, this.endPoint, this.value}) : super(key: key);

  String get formatteValue {
    if (value == null) {
      return '';
    }
    var formatedValue = NumberFormat('#,##,###,###').format(value);
    return formatedValue;
  }

  @override
  Widget build(BuildContext context) {
    print(endPoint);
    final cardData = _cardsData[endPoint];
    // print(cardData.title);
    print('object');
    return Container(
      height: 130,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData.title,
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: cardData.color),
              ),
              SizedBox(height: 2),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      cardData.assetName,
                      height: 50,
                      width: 50,
                      color: cardData.color,
                    ),
                    Text(
                      formatteValue != null ? formatteValue.toString() : ' ',
                      style: Theme.of(context).textTheme.display1.copyWith(
                          color: cardData.color, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
