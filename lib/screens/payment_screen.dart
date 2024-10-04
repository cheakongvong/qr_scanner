import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String paymentId;
  const PaymentScreen({super.key, required this.paymentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(paymentId),
      ),
    );
  }
}
