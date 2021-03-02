import 'package:add_firebase_/Pages/CMS_Content.dart';
import 'package:add_firebase_/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CMS extends StatefulWidget {
  @override
  _CMSState createState() => _CMSState();
}

class _CMSState extends State<CMS> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Map<String, dynamic> productToAdd;

  CollectionReference collectionReference =
      Firestore.instance.collection("products");

  _addProduct() async {
    print("outside");
    productToAdd = {
      // 'name': nameController.text.toString(),
      // 'brand': brandController.text.toString(),
      // 'price': priceController.text.toString(),
      // 'imageUrl': imageUrlController.text.toString(),
      'name': 'Test 4',
      'brand': "Test 4 brand ",
      'price': 14500,
      'imageUrl':
          "https://images.unsplash.com/photo-1559163499-413811fb2344?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80",
    };
    collectionReference
        .add(productToAdd)
        .whenComplete(() => print("Added To Database"));
  }

  _deleteContent() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('products');

    QuerySnapshot querySnapshot = await collectionReference.getDocuments();
    querySnapshot.documents[0].reference.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Container(
                margin: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contect) => CmsContent()));
                  },
                  icon: Icon(
                    Icons.folder,
                  ),
                ))
          ],
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mobile CMS',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(
                    brandController, FontAwesomeIcons.cloudsmith, 'Brand'),
                SizedBox(height: 20),
                _buildTextField(priceController, Icons.money, 'Price'),
                SizedBox(height: 20),
                _buildTextField(imageUrlController, Icons.image, 'Image Url'),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    // print("object");
                    _addProduct();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    height: 50,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: logoGreen),
                    child: Text(
                      "Add Product To Database",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: _deleteContent,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    height: 50,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: logoGreen),
                    child: Text(
                      "Delete at 2nd position",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFooterLogo(),
                )
              ],
            ),
          ),
        ));
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/logo2.png',
          height: 40,
        ),
        Text('The Growing Developer',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
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

  // _signInButton() async {
  // final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  // final GoogleSignInAuthentication googleAuth =
  //     await googleUser.authentication;

  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  // final FirebaseUser user =
  //     (await firebaseAuth.signInWithCredential(credential)).user;

  // print(user.email);

  // print("object");
  // }
}
