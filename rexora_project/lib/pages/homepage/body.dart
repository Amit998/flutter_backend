import 'package:flutter/material.dart';
import 'package:rexora_project/data/category_data.dart';
import 'package:rexora_project/data/project_data.dart';
import 'package:rexora_project/data/topics_data.dart';
import 'package:rexora_project/models/category_model.dart';
import 'package:rexora_project/models/projectsModel.dart';
import 'package:rexora_project/models/topics_model.dart';
import 'package:rexora_project/pages/homepage/views/categoryTile.dart';
import 'package:rexora_project/pages/homepage/views/topic_tiles.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<CategorieModel> categoryList = [];
  List<TopicModel> topicList = [];
  List<ProjectModel> projectList = [];

  @override
  void initState() {
    categoryList = getCatagories();
    topicList = getTopics();
    projectList = getProjects();
    // TODO: implement initState
    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: categoryList.length != null
                  ? ListView.builder(
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                            imgUrl: categoryList[index].imgUrl,
                            title: categoryList[index].categorieName);
                      })
                  : Container(),
            ),
            Container(
                height: 120,
                // width: 150,
                child: topicList != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: topicList.length,
                        itemBuilder: (context, index) {
                          return TopicTile(
                              topicName: topicList[index].topicsName,
                              color: topicList[index].color,
                              imgUrl: topicList[index].imgUrl);
                        })
                    : Container()),
            Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Top Projects",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              // height: 200,
              child: projectList.length == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: projectList.length,
                      // scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProjectTile(
                            projectName: projectList[index].projectName,
                            desc: projectList[index].desc,
                            imgUrl: projectList[index].imgUrl,
                            onTap: projectList[index].onTap);
                      }),
            ),
            Text("data")
          ],
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  String projectName, desc, imgUrl;
  Function onTap;

  ProjectTile(
      {@required this.projectName,
      @required this.desc,
      @required this.imgUrl,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.yellow),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image.network(imgUrl)),
          SizedBox(width: 10),
          Container(
            child: Column(
              children: [Text("data"), Text("data")],
            ),
          )
        ],
      ),
    );
  }
}
