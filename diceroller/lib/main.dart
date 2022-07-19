import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice Roller",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int diceNumber = 1;

  changeDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 23),
        Image.asset("assets/$diceNumber.png", height: 300, width: 300),
        Center(
          child: MaterialButton(
            color: Colors.blue,
            onPressed: changeDice,
            child: Text(
              "Roll ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: 150),
        Text(
          "Created by Abishek Bhattarai",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
