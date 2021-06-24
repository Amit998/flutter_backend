import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:store_app/const/colors.dart';
import 'package:store_app/widgets/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _carsouelImages = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png"
  ];

  List _brandImages = [
    "assets/images/Dell.jpg",
    "assets/images/Huawei.jpg",
    "assets/images/nike.jpg",
    "assets/images/samsung.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.25,
      appBar: BackdropAppBar(
        title: Text("Home"),
        leading: BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ColorsConsts.starterColor, ColorsConsts.endColor])),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ))
        ],
      ),
      backLayer: Center(
        child: Text("Back Layer"),
      ),
      frontLayer: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Colors.purple,
                dotBgColor: Colors.black.withOpacity(0.3),
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 1.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  ExactAssetImage(_carsouelImages[0]),
                  ExactAssetImage(_carsouelImages[1]),
                  ExactAssetImage(_carsouelImages[2]),
                  ExactAssetImage(_carsouelImages[3]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Categoris ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              // Spacer(),
            ),
            Container(
              width: double.infinity,
              height: 180,
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Brands",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  // Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                autoplay: true,
                onTap: (index) {},
                itemCount: _brandImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.blueGrey,
                        child: Image.asset(
                          _brandImages[index],
                          fit: BoxFit.cover,
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    )));
  }
}
