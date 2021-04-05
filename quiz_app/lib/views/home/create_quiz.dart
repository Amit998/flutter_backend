import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/views/home/add_qustions.dart';
import 'package:quiz_app/views/home/home.dart';
import 'package:quiz_app/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class QuizMaker extends StatefulWidget {
  @override
  _QuizMakerState createState() => _QuizMakerState();
}

class _QuizMakerState extends State<QuizMaker> {
  final _formKey = GlobalKey<FormState>();
  String quizUrl, quizTitle, quizdesc, quizId;
  bool _isLoading = false;
  final String imageUrl =
      "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  DatabaseService databaseService = new DatabaseService();

  createOnlineQuiz() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      // quizUrl.isEmpty ? quizUrl = imageUrl : quizUrl = quizUrl;
      quizUrl = imageUrl;

      quizId = randomAlphaNumeric(16);
      Map<String, String> quizData = {
        "quizId": quizId,
        "quizTitle": quizTitle,
        "quizUrl": quizUrl,
        "quizDescription": quizdesc
      };
      await databaseService.addQuizData(quizData, quizId);

      print(quizData);
      setState(() {
        _isLoading = false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddQustion(
                      quizId: quizId,
                    )));
      });
    }
    setState(() {
      _isLoading = false;
    });
    // databaseService.addQuizData(quizData, quizId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      // validator: (value) =>
                      //     value.isEmpty ? "Please Insert a link" : null,
                      decoration: InputDecoration(hintText: "Quiz Image Url"),
                      onChanged: (value) {
                        // setState(() {
                        quizUrl = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Please Add Title" : null,
                      decoration: InputDecoration(hintText: "Quiz Title"),
                      onChanged: (value) {
                        // setState(() {
                        quizTitle = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Description" : null,
                      decoration: InputDecoration(hintText: "Quiz Description"),
                      onChanged: (value) {
                        // setState(() {
                        quizdesc = value;
                        // });
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createOnlineQuiz();
                        },
                        child:
                            blueButton(context: context, label: "Create Quiz")),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
