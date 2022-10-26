import 'package:flutter/material.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

class BonusScreen extends StatefulWidget {
  const BonusScreen({Key? key}) : super(key: key);

  @override
  State<BonusScreen> createState() => _BonusScreenState();
}

class _BonusScreenState extends State<BonusScreen> {
  TextStyle myNormalStyle = TextStyle(
      fontFamily: 'kh', fontWeight: FontWeight.w400, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        // backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Bonus",
          style: TextStyle(color: Colors.black, fontFamily: 'kh'),
          textScaleFactor: 1.1,
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Detail",
                  style: TextStyle(fontFamily: 'kh'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              each("Sold Out (Kip)", "9 Kip", width, Colors.blue),
              SizedBox(
                height: 10,
              ),
              each("Recive Bonus", "${7.5 * 9}\$", width, Colors.yellow.shade800),
              SizedBox(
                height: 10,
              ),
              each("Recive Salary", "${0.00}\$", width, Colors.blue),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget each(String text, String righttext, double width, Color color) {
    return Container(
      width: width * 0.95,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    "${text}",
                    overflow: TextOverflow.ellipsis,
                    style: myNormalStyle,
                    textScaleFactor: 1.2,
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.blue.withOpacity(0.1),
                  child: Text(
                    righttext,
                    style: TextStyle(
                        fontFamily: 'kh', fontWeight: bold, color: color),
                    textScaleFactor: 1.2,
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
