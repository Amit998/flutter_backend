import 'package:flutter/material.dart';
import 'package:quiz_app/views/home/home.dart';
import 'package:quiz_app/widgets/widgets.dart';

class Result extends StatefulWidget {
  final int correctAns, incorrect, total;

  const Result(
      {Key key,
      @required this.correctAns,
      @required this.incorrect,
      @required this.total})
      : super(key: key);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.correctAns} / ${widget.total}",
                style: TextStyle(fontSize: 20),
              ),
              Text(""),
              SizedBox(height: 8),
              Text(
                "You Answered ${widget.correctAns} answers correctly and You Answered ${widget.incorrect} answers are incorrect ",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: blueButton(context: context, label: "Go Home"))
            ],
          ),
        ),
      ),
    );
  }
}
