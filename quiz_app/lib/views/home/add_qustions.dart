import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/widgets/widgets.dart';

class AddQustion extends StatefulWidget {
  final String quizId;

  const AddQustion({Key key, @required this.quizId}) : super(key: key);
  @override
  _AddQustionState createState() => _AddQustionState();
}

class _AddQustionState extends State<AddQustion> {
  String qustion, option1, option2, option3, option4;
  final _key = GlobalKey<FormState>();
  bool _isLoading = false;

  DatabaseService databaseService = new DatabaseService();

  uploadQustionData() async {
    setState(() {
      _isLoading = true;
    });
    if (_key.currentState.validate()) {
      Map<String, String> questionData = {
        "quizId": widget.quizId,
        "qustion": qustion,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      await databaseService
          .addQustionData(questionData, widget.quizId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    setState(() {
      _isLoading = false;
    });
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
              key: _key,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Please Add Qustion Title" : null,
                      decoration: InputDecoration(hintText: "Qustion"),
                      onChanged: (value) {
                        // setState(() {
                        qustion = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Please Option 1" : null,
                      decoration: InputDecoration(
                          hintText: "Option 1 (Correct Answer)"),
                      onChanged: (value) {
                        // setState(() {
                        option1 = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Add Option 2" : null,
                      decoration: InputDecoration(hintText: "Option 2"),
                      onChanged: (value) {
                        // setState(() {
                        option2 = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Add Option 3" : null,
                      decoration: InputDecoration(hintText: "Option 3"),
                      onChanged: (value) {
                        // setState(() {
                        option3 = value;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Add Option 4" : null,
                      decoration: InputDecoration(hintText: "Option 4"),
                      onChanged: (value) {
                        // setState(() {
                        option4 = value;
                        // });
                      },
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: blueButton(
                              context: context,
                              label: "Submit",
                              buttonWidth: 150),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            uploadQustionData();
                          },
                          child: blueButton(
                              context: context, 
                              label: "Add More",
                              buttonWidth: 150),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
