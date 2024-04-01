import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              'I am poor',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 0, 58, 105)),
        backgroundColor: Color.fromARGB(206, 36, 112, 175),
        body: Center(
          child: Image.asset(
            'images/miskin.jpg',
            width: 400, // ubah lebar gambar
            height: 400, // ubah tinggi gambar
          ),
        ),
      ),
    ),
  );
}
