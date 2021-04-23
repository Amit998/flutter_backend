import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.yellow
      ),
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
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectName,
                  style: GoogleFonts.mcLaren().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Flexible(
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      desc,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 3,
                      // style: TextStyle(color: Colors.grey),
                      style: GoogleFonts.mcLaren()
                          .copyWith(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  // width: 70,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      "View",
                      style: GoogleFonts.mcLaren()
                          .copyWith(color: Colors.white, fontSize: 12),
                    ),
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
