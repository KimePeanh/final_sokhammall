import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'withdraw_form.dart';

class WithdrawPending extends StatefulWidget {
  // const WithdrawPending({Key key}) : super(key: key);

  @override
  WithdrawPendingState createState() => WithdrawPendingState();
}

class WithdrawPendingState extends State<WithdrawPending> {
  void _showError(String error) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }

  // final WithdrawBloc withdrawBloc = WithdrawBloc();

  // void initState() {
  //   withdrawBloc.add(GetWithdrawList(status: "pending"));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 8.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "លេខប្រតិបត្តិការ",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text("# s123975")
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            //  Icon(Icons.next_plan_outlined),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.orange[900],
                                    ),
                                    Text(
                                      " ",
                                      style:
                                          TextStyle(color: Colors.orange[900]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "ចំនួន:  ${350.00}\$",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    Text(
                                      "",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "ចំណាំ: ",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> WithdrawForm()));
          }),
    );
  }
}
