import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  MainNewsState createState() => MainNewsState();
}

class MainNewsState extends State<NewsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter News"),
      ),
      body: Container(
        child: ListTile(
          title: Text("Good"),
        ),
      ),
    );
  }
}
