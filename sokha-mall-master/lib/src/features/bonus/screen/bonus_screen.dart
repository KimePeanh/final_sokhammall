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
              each("Sold Out (Kip)", "0 Kip", width,
                  Theme.of(context).primaryColor, 'assets/icons/box.png'),
              SizedBox(
                height: 10,
              ),
              each("Recive Bonus", "${0.00}\$", width,
                  Theme.of(context).primaryColor, 'assets/icons/gift.png'),
              SizedBox(
                height: 10,
              ),
              each("Recive Salary", "${0.00}\$", width,
                  Theme.of(context).primaryColor, 'assets/icons/money.png'),
              SizedBox(
                height: 20,
              ),
              money(),
            ],
          ),
        ),
      ),
    );
  }

  Widget each(
      String text, String righttext, double width, Color color, String image) {
    return Container(
      width: width * 0.95,
      child: Column(
        children: <Widget>[
          Container(
            // height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Text(
                        "${text}",
                        overflow: TextOverflow.ellipsis,
                        style: myNormalStyle,
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(image),
                        width: 35,
                        height: 35,
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  // color: Colors.blue.withOpacity(0.1),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
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

  Widget money() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Row(
              children: [
                Text(
                  "Total amount",
                  overflow: TextOverflow.ellipsis,
                  style: myNormalStyle,
                  textScaleFactor: 1.2,
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("assets/icons/money-bag.png"),
                  width: 35,
                  height: 35,
                )
              ],
            ),
          )),
          Expanded(child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).primaryColor)
            ),
            child: Text("0.00\$", style: TextStyle(fontFamily: 'kh', color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),textScaleFactor: 1.2,),
          )),
        ],
      ),
    );
  }
}
