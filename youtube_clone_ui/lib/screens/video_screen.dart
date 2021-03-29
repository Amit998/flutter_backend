import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone_ui/data.dart';
import 'package:youtube_clone_ui/screens/nav_screeen.dart';
import 'package:youtube_clone_ui/widgets/widgets.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read(miniPlayerControllerProvider)
          .state
          .animateToHeight(state: PanelState.MIN),
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, watch, _) {
                    final selectedVideo = watch(selectedVideoProvider).state;
                    return SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                selectedVideo!.thumbnailUrl,
                                height: 220.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read(miniPlayerControllerProvider)
                                        .state
                                        .animateToHeight(state: PanelState.MIN);
                                  },
                                  iconSize: 30.0,
                                  icon: const Icon(Icons.keyboard_arrow_down)),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                          VideoInfo(video: selectedVideo),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final video = suggestedVideos[index];
                return VideoCard(
                  video: video,
                  hasPadding: true,
                  onTap: () => _scrollController!.animateTo(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  ),
                );
              }, childCount: suggestedVideos.length))
            ],
          ),
        ),
      ),
    );
  }
}
