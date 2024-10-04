import 'package:flutter/material.dart';

class BookPlaces extends StatelessWidget {
  final String placeId;
  const BookPlaces({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Place Screen'),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(placeId),
      ),
    );
  }
}
