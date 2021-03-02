import 'package:add_firebase_/variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  CollectionReference collectionReference =
      Firestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data.documents[index].data;
                  return ListTile(
                    leading: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        nameController.text = data['name'];
                        brandController.text = data['brand'];
                        priceController.text = data['price'].toString();
                        imageUrlController.text = data['imageUrl'];
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                    width: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    color: primaryColor,
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        SizedBox(height: 20),
                                        _buildTextField(nameController,
                                            Icons.account_circle, 'Username'),
                                        SizedBox(height: 20),
                                        _buildTextField(
                                            brandController,
                                            FontAwesomeIcons.cloudsmith,
                                            'Brand'),
                                        SizedBox(height: 20),
                                        _buildTextField(priceController,
                                            Icons.money, 'Price'),
                                        SizedBox(height: 20),
                                        _buildTextField(imageUrlController,
                                            Icons.image, 'Image Url'),
                                        SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            snapshot
                                                .data.documents[index].reference
                                                .updateData({
                                              'name': nameController.text
                                                  .toString(),
                                              'brand': brandController.text
                                                  .toString(),
                                              'price': priceController.text
                                                  .toString(),
                                              'imageUrl': imageUrlController
                                                  .text
                                                  .toString(),
                                            }).whenComplete(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(12),
                                            height: 50,
                                            width: 220,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: logoGreen),
                                            child: Text(
                                              "Update",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            snapshot
                                                .data.documents[index].reference
                                                .delete()
                                                .whenComplete(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(12),
                                            height: 50,
                                            width: 220,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red),
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                        // Navih
                      },
                    ),
                    title: Text(
                      data['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['brand'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          data['price'].toString(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    // trailing: Image.network(
                    //   data['imageUrl'],
                    //   height: 100,
                    //   width: 100,
                    //   fit: BoxFit.cover,
                    // ),
                    // trailing: CachedNetworkImage(
                    //   imageUrl: 'https://picsum.photos/250?image=9',
                    // ),
                    trailing: CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      imageUrl: 'https://picsum.photos/250?image=9',
                    ),
                  );
                },
              );
            } else {
              return Text("Empty");
            }
          }),
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
          border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
