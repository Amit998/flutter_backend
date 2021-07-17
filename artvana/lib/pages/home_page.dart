import 'package:artvana/data/image_data.dart';
import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/home_page/MainHeaderSlideImage.dart';
import 'package:artvana/pages/home_page/tabbar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<ImageDetails> _images = [];
  List<ImageDetails> _sketchImages = [];
  List<ImageDetails> _artWorkImages = [];

  @override
  void initState() {
    _images = images;
    _sketchImages = images;
    _artWorkImages = images;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Artvana",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.search))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Latest Images Of Bee's Collections",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        ImageDetails imageDetails = _images[index];
                        return MainHeaderSlideImage(imageDetails: imageDetails);
                      }),
                ),
                DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: TabBar(
                            labelColor: Colors.purple,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Sketch'),
                              Tab(text: 'ArtWork'),
                            ],
                          ),
                        ),
                        Container(
                          height: 400,
                          child: TabBarView(
                            children: [
                              TabBarSection(
                                  images: _sketchImages, title: "Sketches"),
                              TabBarSection(
                                images: _artWorkImages,
                                title: "ArtWork",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}






