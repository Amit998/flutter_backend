import 'package:flutter/material.dart';
import 'package:rexora_project/models/projectsModel.dart';
import 'package:rexora_project/pages/homepage/views/project_Tile.dart';


class ProjectList extends StatelessWidget {
  const ProjectList({
    Key key,
    @required this.projectList,
  }) : super(key: key);

  final List<ProjectModel> projectList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

