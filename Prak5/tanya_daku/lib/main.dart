import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const TanyaDakuApp());
}

class TanyaDakuApp extends StatelessWidget {
  const TanyaDakuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HalamanBola(),
    );
  }
}

class HalamanBola extends StatelessWidget {
  const HalamanBola({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Tanya Daku Apa Saja",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Bola(),
      backgroundColor: Colors.blue,
    );
  }
}

class Bola extends StatefulWidget {
  const Bola({super.key});

  @override
  State<Bola> createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  int nomorBola = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          print("Tombol telah ditekan");
          int newNumber =
              Random().nextInt(5); // Step 3: Random number between 0 and 4
          print(
              "Nomor Bola: $newNumber"); // Step 4: Print the number to the console
          setState(() {
            nomorBola = newNumber;
          });
        },
        child: Image.asset('images/ball$nomorBola.png'),
      ),
    );
  }
}
