import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/ic_launcher.jpg"),
            fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar:
            AppBar(backgroundColor: Colors.green, brightness: Brightness.dark),
        backgroundColor: Colors.green,
      ),
    );
  }
}
