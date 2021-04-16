import 'package:rexora_project/models/projectsModel.dart';

List<ProjectModel> getProjects() {
  List<ProjectModel> projects = [];
  ProjectModel projectModel = new ProjectModel();
  projectModel.onTap = () {};
  projectModel.projectName = "Project 1";
  projectModel.imgUrl =
      "https://miro.medium.com/max/904/1*eICUKgpRYcYPj7qygenLCA.png";
  projectModel.desc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  projects.add(projectModel);

  projectModel = new ProjectModel();
  projectModel.onTap = () {};
  projectModel.projectName = "Project 1";
  projectModel.imgUrl =
      "https://miro.medium.com/max/904/1*eICUKgpRYcYPj7qygenLCA.png";
  projectModel.desc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  projects.add(projectModel);

  projectModel = new ProjectModel();
  projectModel.onTap = () {};
  projectModel.projectName = "Project 2";
  projectModel.imgUrl =
      "https://miro.medium.com/max/904/1*eICUKgpRYcYPj7qygenLCA.png";
  projectModel.desc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  projects.add(projectModel);

  projectModel = new ProjectModel();
  projectModel.onTap = () {};
  projectModel.projectName = "Project 3";
  projectModel.imgUrl =
      "https://miro.medium.com/max/904/1*eICUKgpRYcYPj7qygenLCA.png";
  projectModel.desc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  projects.add(projectModel);

  projectModel = new ProjectModel();
  projectModel.onTap = () {};
  projectModel.projectName = "Project 4";
  projectModel.imgUrl =
      "https://miro.medium.com/max/904/1*eICUKgpRYcYPj7qygenLCA.png";
  projectModel.desc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  projects.add(projectModel);

  // print(projects.length);

  return projects;
}
