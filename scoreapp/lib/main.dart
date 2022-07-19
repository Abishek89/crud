import 'package:flutter/material.dart';

void main() {
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Score App",
      home: ScoreHome(),
    );
  }
}

class ScoreHome extends StatefulWidget {
  @override
  State<ScoreHome> createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome> {
  int number = 0;

  void increase() {
    setState(() {
      number++;
    });
  }

  void decrease() {
    setState(() {
      number--;
    });
  }

  void resetNumber() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Changer"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore_from_trash_outlined),
        onPressed: resetNumber,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          Center(
            child: Text(
              "Your Score is: ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 115,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Increase'),
                onPressed: increase,
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                child: Text(
                  'Decrease',
                ),
                onPressed: decrease,
              ),
            ],
          )
        ],
      ),
    );
  }
}
