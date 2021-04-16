import 'package:flutter/material.dart';

class ProjectModel {
  String projectName, desc, imgUrl;
  Function onTap;

  ProjectModel({this.projectName, this.desc, this.imgUrl, this.onTap});
}
