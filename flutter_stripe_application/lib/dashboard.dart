import 'dart:async';
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            makePayMent();
          },
          child: Text("Pay Amout"),
        ),
      ),
    );
  }

  Future<void> makePayMent() async {
    final url = Uri.parse("");

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    paymentIntentData = jsonDecode(response.body);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
      applePay: true,
      googlePay: true,
      style: ThemeMode.dark,
      merchantCountryCode: 'US',
      merchantDisplayName: 'Amit',
    ));

    setState(() {});

    displayPaymentSheet();
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
              clientSecret: paymentIntentData!['paymentIntent'],
              confirmPayment: true));

      setState(() {
        paymentIntentData = null;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Paid Successfully")));
    } catch (e) {
      print(e);
    }
  }
}
