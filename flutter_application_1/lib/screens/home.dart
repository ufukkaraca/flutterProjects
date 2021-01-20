import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0x000080),
      child: Center(
        child: MaterialButton(
          onPressed: () {},
          child: Text(sayHello(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  String sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    hello = hour < 12 ? "Good Morning" : "Good Evening";
    return hello;
  }
}
