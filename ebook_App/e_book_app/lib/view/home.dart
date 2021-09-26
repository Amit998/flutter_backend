import 'package:card_swiper/card_swiper.dart';
import 'package:e_book_app/controller/conn_ebook.dart';
import 'package:e_book_app/model/ebook/model_ebook.dart';
import 'package:e_book_app/view/bottom_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<ModelEbook>>? getSlider;
  List<ModelEbook> listSlider = [];

  @override
  void initState() {
    super.initState();

    getSlider = fetchEBook(listSlider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getSlider,
            builder: (BuildContext context,
                AsyncSnapshot<List<ModelEbook>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    // Slider

                    Container(
                      child: FutureBuilder(
                          future: getSlider,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ModelEbook>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // CREATE DESIGN IN HERE

                              return SizedBox(
                                height: 27.0,
                                child: Swiper(
                                  autoplay: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector();
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    )

                    // Latest Ebook

                    // Adds

                    // Category
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
