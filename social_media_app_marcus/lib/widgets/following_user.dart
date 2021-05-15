import 'package:flutter/material.dart';
import 'package:social_media_app_marcus/data/data.dart';
import 'package:social_media_app_marcus/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 20),
          child: Text(
            "Following",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 1),
          ),
        ),
        Container(
          height: 80.0,
          // color: Colors.red,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme.of(context).primaryColor),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 8.0)
                  ],
                ),
                child: ClipOval(
                  child: InkWell(
                    onTap: () {},
                    child: Image(
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          user.profileImageUrl,
                        )),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
