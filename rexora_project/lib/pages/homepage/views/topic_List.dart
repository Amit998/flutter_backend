import 'package:flutter/material.dart';
import 'package:rexora_project/models/topics_model.dart';
import 'package:rexora_project/pages/homepage/views/topic_tiles.dart';

class TopicList extends StatelessWidget {
  const TopicList({
    Key key,
    @required this.topicList,
  }) : super(key: key);

  final List<TopicModel> topicList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            : Container());
  }
}
