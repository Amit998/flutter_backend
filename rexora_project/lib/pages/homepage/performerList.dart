import 'package:flutter/material.dart';
import 'package:rexora_project/models/performer_model.dart';
import 'package:rexora_project/pages/homepage/performerTile.dart';


class PerformerList extends StatelessWidget {
  const PerformerList({
    Key key,
    @required this.performerList,
  }) : super(key: key);

  final List<PerformerModel> performerList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: performerList.length == null
            ? Container()
            : Container(
                height: 160,
                // width: 100,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: performerList.length,
                    itemBuilder: (context, index) {
                      return PerformerTile(
                          id: performerList[index].id,
                          imageUrl: performerList[index].imgStr,
                          name: performerList[index].name);
                    })));
  }
}
