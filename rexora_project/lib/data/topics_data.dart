import 'package:flutter/material.dart';
import 'package:rexora_project/models/topics_model.dart';

List<TopicModel> getTopics() {
  List<TopicModel> topics = [];

  TopicModel topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "AI";

  topics.add(topicModel);

  topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "ML";

  topics.add(topicModel);

  topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "PI";

  topics.add(topicModel);

  topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "C";

  topics.add(topicModel);

  topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "Python";

  topics.add(topicModel);

  topicModel = new TopicModel();
  topicModel.color = Colors.blue;
  topicModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  ;
  topicModel.topicsName = "App Development";

  topics.add(topicModel);

  return topics;
}
