import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WithdrawDetail extends StatefulWidget {
  // final WithdrawModel withdrawModel;
  // const WithdrawDetail({Key key, @required this.withdrawModel})
  //     : super(key: key);
  @override
  _WithdrawDetailState createState() => _WithdrawDetailState();
}

class _WithdrawDetailState extends State<WithdrawDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Withdraw Detail",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1.0, color: Colors.grey.shade300),
            color: Colors.grey[100],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trans ID :",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Date :",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Note : ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Amount : ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Type :",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Member ID : ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Status : ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                child: CupertinoButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
