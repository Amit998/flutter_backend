import 'package:flutter/material.dart';
import 'package:rexora_project/data/category_data.dart';
import 'package:rexora_project/data/performer_data.dart';
import 'package:rexora_project/data/project_data.dart';
import 'package:rexora_project/data/topics_data.dart';
import 'package:rexora_project/models/category_model.dart';
import 'package:rexora_project/models/performer_model.dart';
import 'package:rexora_project/models/projectsModel.dart';
import 'package:rexora_project/models/topics_model.dart';
import 'package:rexora_project/pages/homepage/performerList.dart';

import 'package:rexora_project/pages/homepage/views/ProjectList.dart';
import 'package:rexora_project/pages/homepage/views/categoryList.dart';
import 'package:rexora_project/pages/homepage/views/heading.dart';
import 'package:rexora_project/pages/homepage/views/topic_List.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<CategorieModel> categoryList = [];
  List<TopicModel> topicList = [];
  List<ProjectModel> projectList = [];
  List<PerformerModel> performerList = [];

  @override
  void initState() {
    categoryList = getCatagories();
    topicList = getTopics();
    projectList = getProjects();
    performerList = getPermormer();

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
            CategoryList(categoryList: categoryList),
            TopicList(topicList: topicList),
            Heading(
              name: "Top Projects",
            ),
            ProjectList(projectList: projectList),
            // SizedBox(
            //   height: 10,
            // ),
            Heading(
              name: "Top 10 Performer",
            ),
            PerformerList(performerList: performerList)
          ],
        ),
      ),
    );
  }
}
