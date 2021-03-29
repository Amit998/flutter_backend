import 'package:flutter/material.dart';
import 'package:youtube_clone_ui/data.dart';
// import 'package:youtube_clone_ui/widgets/video_card.dart';
// import 'package:youtube_clone_ui/widgets/custom_silver_app_bar.dart';
import 'package:youtube_clone_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        CustomSilverAppbar(),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final video = videos[index];
              return VideoCard(video: video);
              // print(video.author.username);
            },
            childCount: videos.length,
          )),
        )
      ]),
    );
  }
}
