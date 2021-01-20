import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  runApp(MaterialApp(
      title: "Hello Flutter App",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Title in AppBar"),
          ),
          body: Home())));
}
