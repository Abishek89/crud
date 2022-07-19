import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Profile Details",
    home: Scaffold(
      appBar: AppBar(
        title: Text('Here is the details of my profile'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset("assets/Abhi.jpeg", height: 250, width: 250),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Hello! Myself Abishek Bhattarai',
            style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Address: Sundarharaincha-4, Morang',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'E-mail: abishekbhattarai81@gmail.com',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Phone-Number: 9819368669',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(height: 20),
          Text(
            'Social Links',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 10),
          Text(
            'Facebook: Abishek Bhattarai',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(height: 10),
          Text(
            'Instagram: imabishekk',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(height: 10),
          Text(
            'Twitter: i_m_abishekk',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Thanks for visiting my website',
            style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Have a Nice Day Everyone :)',
            style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Created by: Abishek Bhattarai',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
      ),
    ),
  ));
}
