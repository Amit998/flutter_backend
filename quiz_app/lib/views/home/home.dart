import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/views/home/create_quiz.dart';
import 'package:quiz_app/views/home/play_quiz.dart';
import 'package:quiz_app/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;

  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    // print(databaseService.getQuizData());
    databaseService.getQuizData().then((val) {
      // quizStream = val;
      setState(() {
        quizStream = val;
      });
      // print(val);
    });
    super.initState();
    // quizStream = databaseService.getQuizData();
  }

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          // print(snapshot.data.documents.length);
          print("object");
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return QuizTile(
                        quizId: snapshot.data.documents[index].data["quizId"],
                        imgUrl: snapshot.data.documents[index].data["quizUrl"],
                        title: snapshot.data.documents[index].data["quizTitle"],
                        desc: snapshot
                            .data.documents[index].data["quizDescription"]);
                  });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuizMaker()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl, title, desc, quizId;

  const QuizTile(
      {Key key,
      @required this.quizId,
      @required this.imgUrl,
      @required this.title,
      @required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(quizId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlayQuiz(
                      quizId: quizId,
                    )));
      },
      child: Container(
        height: 150,
        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Stack(
          children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgUrl,
                    width: MediaQuery.of(context).size.width - 48,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    desc.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
