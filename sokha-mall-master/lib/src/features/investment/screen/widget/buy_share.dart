import 'package:flutter/material.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

class BuyShare extends StatefulWidget {
  // const BuyShare({ Key? key }) : super(key: key);

  @override
  State<BuyShare> createState() => _BuyShareState();
}

class _BuyShareState extends State<BuyShare> {
  
  TextStyle myNormalStyle = TextStyle(
      fontFamily: 'ab', fontWeight: FontWeight.normal, color: Colors.black);
  int qty = 1;
  void increase(){
    setState(() {
      qty ++;
    });
  }
  void discrease(){
    if (qty > 1){
      setState(() {
        qty --;
      });
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    "Quantity",
                    style: myNormalStyle,
                    textScaleFactor: 1.2,
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.shade600,
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onTap: (){
                          discrease();
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "${qty}",
                        style: myNormalStyle,
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onTap: (){
                          increase();
                        },
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),      
          each("Value", "\$ 1000", width, Colors.red.shade600),
          SizedBox(height: 10,),
          each("Make a profit in 1 year", "\$ ${qty * 400}", width, Colors.red.shade600),
          SizedBox(height: 10,),
          each("Total", "\$ ${qty*1000 + qty * 400}", width, Colors.red.shade600),
        ],
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
                        fontFamily: 'ab', fontWeight: bold, color: color),
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
