import 'package:flutter/material.dart';
import 'package:sokha_mall/src/features/withdraw/widget/withdraw_cancel.dart';
import 'package:sokha_mall/src/features/withdraw/widget/withdraw_completed.dart';
import 'package:sokha_mall/src/features/withdraw/widget/withdraw_pending.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _tapNav = <Tab>[
    // Tab(
    //   text: AppLocalizations.of(context).translate("toPay"),
    // ),
    Tab(
      text: "Pending",
    ),
    Tab(
      text: "Completed",
    ),
    Tab(
      text: "Cancel",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          // backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Withdraw",
            style: TextStyle(color: Colors.black),
            textScaleFactor: 1.2,
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
        body: DefaultTabController(
          length: _tapNav.length,
          child: Scaffold(
            appBar: new PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Colors.white,
                height: 50.0,
                child: TabBar(
                  tabs: _tapNav,
                  labelColor: Theme.of(context).primaryColor,
                  indicatorColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.only(top: 8.0),
              child: TabBarView(children: [
                WithdrawPending(),
                WithdrawCompleted(),
                WithdrawCancel()
              ]),
            ),
          ),
        ));
  }
}
