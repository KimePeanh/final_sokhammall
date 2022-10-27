import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/account/bloc/account_bloc.dart';
import 'package:sokha_mall/src/features/account/bloc/account_event.dart';
import 'package:sokha_mall/src/features/account/bloc/account_state.dart';
import 'package:sokha_mall/src/features/investment/screen/schudule.dart';
import 'package:sokha_mall/src/features/withdraw/screen/withdraw_screen.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  AccountBloc accountBloc = AccountBloc();
  @override
  void dispose() {
    accountBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        // backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(color: Colors.black),
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
      body: BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
        if (state is ErrorFetchingAccount) {
          Helper.handleState(state: state, context: context);
          BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
          return Center();
        } else if (state is FetchedAccount) {
          print(state.user);
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withAlpha(200),
                        // color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/6072812.jpg')),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              blurRadius: 2)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          // color: Colors.amber,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            image: AssetImage("assets/images/wallet.png"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          // alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${state.user.walletModel!.balance}\$",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'kh',
                                        fontWeight: FontWeight.bold),
                                    textScaleFactor: 2,
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "withdraw",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontFamily: 'kh',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                    textScaleFactor: 0.9,
                                  ))
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                decoration: BoxDecoration(
                                  color: Color(0xff79CBF9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/calendar.png"),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Schecdule()));
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Schedule",
                                    style: TextStyle(
                                        fontFamily: 'kh',
                                        fontWeight: FontWeight.bold),
                                  )),
                              onTap: () {},
                            )
                          ],
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFC7A89),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(
                                    image: AssetImage("assets/images/sav.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Withdraw",
                                      style: TextStyle(
                                          fontFamily: 'kh',
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WithdrawScreen()));
                          },
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.9,
                  //   child: Row(
                  //     children: <Widget>[
                  //       Expanded(
                  //           child: Container(
                  //         child: Text(
                  //           "Recent activity",
                  //           style: TextStyle(
                  //             fontFamily: 'kh',
                  //             fontWeight: FontWeight.bold,
                  //             // foreground: Paint()..shader = linearGradient,
                  //           ),
                  //           textScaleFactor: 1.1,
                  //         ),
                  //       )),
                  //       Expanded(
                  //           child: Container(
                  //         alignment: Alignment.centerRight,
                  //         child: Text(
                  //           "See All",
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //             fontFamily: 'kh',
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   // color: white,
                  //   // padding: EdgeInsets.only(left: 10,right: 10),
                  //   child: ListTile(
                  //     leading: Container(
                  //       width: 60,
                  //       height: 60,
                  //       padding: EdgeInsets.all(15),
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle, color: Colors.green),
                  //       child: ImageIcon(
                  //           AssetImage('assets/icons/downloads.png'),
                  //           color: Colors.white),
                  //     ),
                  //     title: Text(
                  //       "First Profit from investment",
                  //       overflow: TextOverflow.ellipsis,
                  //       style: TextStyle(fontFamily: 'kh'),
                  //       textScaleFactor: 1,
                  //     ),
                  //     subtitle: Text("23-Aug | 2:37 PM"),
                  //     trailing: Text(
                  //       "350.00\$",
                  //       style: TextStyle(
                  //           fontFamily: 'a',
                  //           color: Colors.green,
                  //           fontWeight: bold),
                  //       textScaleFactor: 1.1,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        } else {
          return Container(
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()));
        }
      }),
    );
  }
}
