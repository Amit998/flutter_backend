import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
  }

  void handlerErrorFailure() {
    print("Payment Error");
  }

  void handlerExternalWallet() {
    print("External Wallet");
  }

  void openCheckout() {
    var options = {
      "key": "",
      "amount": textEditingController.text.toString(),
      "name": "sample app",
      "description": "Payment for some random project",
      "prefil": {"contact": "", "email": ""},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay"),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "Enter The Amount",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              // print("object");
              openCheckout();
            },
            child: Text(
              "Donate Now",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
