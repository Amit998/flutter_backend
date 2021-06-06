import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:integration_rest_api_product_list/controllers/product_controller.dart';
import 'package:integration_rest_api_product_list/models/product_list.dart';
import 'package:integration_rest_api_product_list/pages/product_tile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ShopX",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.list,
                          size: 36,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.grid_view,
                          size: 28,
                        ))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return StaggeredGridView.countBuilder(
                  itemCount: productController.productList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  });
            }),
          )
        ],
      ),
    );
  }
}
