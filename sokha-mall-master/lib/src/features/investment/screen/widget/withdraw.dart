import 'package:flutter/material.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

class Withdraw extends StatefulWidget {
  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  TextStyle myNormalStyle = TextStyle(
      fontFamily: 'ab', fontWeight: FontWeight.normal, color: Colors.black);
  
  List<int> month = [3, 6, 12];
  int index = 0;

  void inscrease (){
    if (index <= 2){
      setState(() {
        index++;
      });
    }else{

    }
  }

  void discrease(){
    index--;
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
                    "Open every ( Month )",
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
                          // inscrease();
                          if(index > 0){
                            discrease();
                          }else{
                            setState(() {
                              index = 0;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "${month[index]}",
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
                          if(index <=1){
                            inscrease();
                          }else if (index > 1){
                            setState(() {
                              index = 2;
                            });
                          }
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
          each("Money to be paid", "\$ ${1400/(12/month[index])}", width, Colors.blue),
          SizedBox(
            height: 20,
          ),
          
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
                    style: myNormalStyle,
                    textScaleFactor: 1.2,
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.blue.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        righttext,
                        style: TextStyle(
                            fontFamily: 'ab', fontWeight: bold, color: color),
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.calendar_today_rounded, color: Colors.blue,)
                    ],
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
