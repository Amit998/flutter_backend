import 'package:flutter/material.dart';

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
              children: [
                Text(projectName),
                Text(
                  "desc",
                  maxLines: 2,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("View"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
