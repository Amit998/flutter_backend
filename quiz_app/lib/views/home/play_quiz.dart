import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/qustionModel.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/views/home/quiz_play_widget.dart';
import 'package:quiz_app/widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  final String quizId;

  const PlayQuiz({Key key, @required this.quizId}) : super(key: key);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;

int _correct = 0;
int _notAttempt = 0;
int _incorrect = 0;

class _PlayQuizState extends State<PlayQuiz> {
  DatabaseService databaseService = new DatabaseService();

  String quizId;
  QuerySnapshot qustionsnapshot;

  QustionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot qustionsnapshot) {
    QustionModel qustionModel = new QustionModel();

    qustionModel.quistion = qustionsnapshot.data["qustion"];

    List<String> options = [
      qustionsnapshot.data["option1"],
      qustionsnapshot.data["option2"],
      qustionsnapshot.data["option3"],
      qustionsnapshot.data["option4"]
    ];
    options.shuffle();
    qustionModel.option1 = options[0];
    qustionModel.option2 = options[1];
    qustionModel.option3 = options[2];
    qustionModel.option4 = options[3];
    qustionModel.correctOption = qustionsnapshot.data["option1"];
    qustionModel.answered = false;

    return qustionModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    quizId = widget.quizId;
    databaseService.getQuizQustions(widget.quizId).then((val) {
      setState(() {
        qustionsnapshot = val;
      });
    });
    _notAttempt = 0;
    _correct = 0;
    _incorrect = 0;
    total = qustionsnapshot.documents.length;

    print("$total this is total ${quizId}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.1,
        iconTheme: IconThemeData(color: Colors.black38),
      ),
      body: Container(
        child: Column(
          children: [
            qustionsnapshot.documents == null
                ? Container(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: qustionsnapshot.documents.length,
                        itemBuilder: (context, index) {
                          // QusttionMode qustionMode=
                          return QuizPlayTile(
                            qustionModel: getQuestionModelFromDatasnapshot(
                              qustionsnapshot.documents[index],
                            ),
                            index: index,
                          );
                        }),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QustionModel qustionModel;
  final int index;
  QuizPlayTile({this.qustionModel, this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.qustionModel.quistion),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.qustionModel.option1,
            description: widget.qustionModel.option1,
            option: "A",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.qustionModel.option1,
            description: widget.qustionModel.option2,
            option: "B",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.qustionModel.option1,
            description: widget.qustionModel.option3,
            option: "C",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.qustionModel.option1,
            description: widget.qustionModel.option4,
            option: "D",
            optionSelected: optionSelected,
          )
        ],
      ),
    );
  }
}
