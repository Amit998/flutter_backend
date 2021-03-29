import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone_ui/data.dart';
import 'package:youtube_clone_ui/screens/home_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone_ui/screens/video_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
        (ref) => MiniplayerController());

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text("Explore"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Add"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Subcription"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Libery"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state;
          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;
          print(selectedVideo);
          return Stack(
            children: _screens
                .asMap()
                .map(
                  (i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      )),
                )
                .values
                .toList()
                  ..add(Offstage(
                    offstage: selectedVideo == null,
                    child: Miniplayer(
                      controller: miniPlayerController,
                      maxHeight: MediaQuery.of(context).size.height,
                      minHeight: _playerMinHeight,
                      builder: (height, percentage) {
                        if (selectedVideo == null) {
                          return const SizedBox.shrink();
                        }
                        if (height <= _playerMinHeight + 50.0)
                          return Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        selectedVideo.thumbnailUrl,
                                        height: _playerMinHeight - 4.0,
                                        width: 120.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  selectedVideo.title,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 15.0),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "${selectedVideo.author.username}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 12.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.play_arrow)),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read(selectedVideoProvider)
                                                .state = null;
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                  const LinearProgressIndicator(
                                    value: 0.4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.red),
                                  )
                                ],
                              ));
                        return VideoScreen(
                          
                        );
                      },
                    ),
                  )),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: "Explore",
              activeIcon: Icon(Icons.explore_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "Add",
              activeIcon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Home",
              activeIcon: Icon(Icons.subscriptions_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Home",
              activeIcon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
