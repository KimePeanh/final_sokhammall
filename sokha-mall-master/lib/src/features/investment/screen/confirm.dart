import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sokha_mall/src/features/app/screens/app_page.dart';


class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({ Key? key }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {

  void push (){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AppPage()));
    });
  }
  @override
  void initState() {
    push ();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/images/972-done.json"),
      ),
    );
  }
}