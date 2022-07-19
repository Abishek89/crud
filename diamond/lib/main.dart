import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Diamond'),
        backgroundColor: Colors.amberAccent,
      ),
      body: const Center(
          child: Image(
        image: AssetImage('images/diamond.png'),
      )),
    ),
  ));
}
