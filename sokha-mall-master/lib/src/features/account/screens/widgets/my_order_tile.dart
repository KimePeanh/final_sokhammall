import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/config/routes/routes.dart';
import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/features/my_order/screens/my_order_page.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import '../../../../../main.dart';
import '../../../../appLocalizations.dart';

Widget myOrderTile(context) {
  Widget _tile(
      {required String name,
      required Function onPressed,
      required Widget icon}) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Column(
        children: [
          icon,
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.translate(name),
              textScaleFactor: 0.8,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(letterSpacing: 0.8))
        ],
      ),
    );
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              BlocProvider.of<MyOrderBloc>(context).add(FetchMyOrder());
              orderByPaidBloc.add(FetchMyOrder());
              orderByOnDeliveryBloc.add(FetchMyOrder());
            }
            return BlocBuilder<MyOrderBloc, MyOrderState>(
              builder: (context, state) {
                // Helper.handleState(state: state, context: context);
                if (BlocProvider.of<MyOrderBloc>(context).orderList.length == 0)
                  return _tile(
                      name: "toPay",
                      icon: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(standardBorderRadius)),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 30,
                          width: 30,
                          child: ImageIcon(
                            AssetImage(
                              "assets/icons/order_status/to_pay.png",
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(myOrder, arguments: 0);
                      });
                return _tile(
                    name: "toPay",
                    icon: Badge(
                      padding: EdgeInsets.all(8),
                      badgeColor: Colors.red,
                      badgeContent: Text(
                          BlocProvider.of<MyOrderBloc>(context)
                              .orderList
                              .length
                              .toString(),
                          textScaleFactor: 0.9,
                          style: TextStyle(color: Colors.white)),
                      position: BadgePosition.topEnd(top: -5, end: -1),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(standardBorderRadius)),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 30,
                          width: 30,
                          child: ImageIcon(
                            AssetImage(
                              "assets/icons/order_status/to_pay.png",
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Icon(
                    //   Icons.attach_money_outlined,
                    //   color: Colors.yellow[800],
                    // ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyOrderPage(
                                    initIndex: 0,
                                  )));
                      // Navigator.of(context)
                      //     .pushNamed(myOrder, arguments: 0);
                    });
              },
            );
          }),
        ),
        SizedBox(width: 10),
        Expanded(
            flex: 1,
            child: BlocBuilder(
              bloc: orderByPaidBloc,
              builder: (c, state) {
                if (orderByPaidBloc.orderList.length == 0)
                  return _tile(
                      name: "paid",
                      icon: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(standardBorderRadius)),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 30,
                          width: 30,
                          child: ImageIcon(
                              AssetImage(
                                "assets/icons/order_status/paid.png",
                              ),
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(myOrder, arguments: 1);
                      });
                return _tile(
                    name: "paid",
                    icon: Badge(
                      padding: EdgeInsets.all(8),
                      badgeColor: Colors.red,
                      badgeContent: Text(
                          orderByPaidBloc.orderList.length.toString(),
                          textScaleFactor: 0.9,
                          style: TextStyle(color: Colors.white)),
                      position: BadgePosition.topEnd(top: -5, end: -1),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(standardBorderRadius)),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 30,
                          width: 30,
                          child: ImageIcon(
                              AssetImage(
                                "assets/icons/order_status/paid.png",
                              ),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(myOrder, arguments: 1);
                    });
              },
            )),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: BlocBuilder(
            bloc: orderByOnDeliveryBloc,
            builder: (c, state) {
              if (orderByOnDeliveryBloc.orderList.length == 0) {
                return _tile(
                    name: "onDelivery",
                    icon: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(standardBorderRadius)),
                      child: Container(
                        margin: EdgeInsets.all(12),
                        height: 30,
                        width: 30,
                        child: ImageIcon(
                            AssetImage(
                              "assets/icons/order_status/on_delivery.png",
                            ),
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(myOrder, arguments: 2);
                    });
              }
              return BlocBuilder(
                bloc: orderByOnDeliveryBloc,
                builder: (c, state) {
                  if (orderByOnDeliveryBloc.orderList.length == 0) {
                    return _tile(
                        name: "onDelivery",
                        icon: Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(standardBorderRadius)),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 30,
                            width: 30,
                            child: ImageIcon(
                                AssetImage(
                                  "assets/icons/order_status/on_delivery.png",
                                ),
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(myOrder, arguments: 2);
                        });
                  }
                  return Badge(
                    padding: EdgeInsets.all(8),
                    badgeColor: Colors.red,
                    badgeContent: Text(
                        orderByOnDeliveryBloc.orderList.length.toString(),
                        textScaleFactor: 0.9,
                        style: TextStyle(color: Colors.white)),
                    position: BadgePosition.topEnd(top: -5, end: -1),
                    child: _tile(
                        name: "onDelivery",
                        icon: Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(standardBorderRadius)),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 30,
                            width: 30,
                            child: ImageIcon(
                                AssetImage(
                                  "assets/icons/order_status/on_delivery.png",
                                ),
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(myOrder, arguments: 2);
                        }),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
            flex: 1,
            child: _tile(
                name: "completed",
                icon: Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(standardBorderRadius)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 30,
                    width: 30,
                    child: ImageIcon(
                        AssetImage(
                          "assets/icons/order_status/completed.png",
                        ),
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(myOrder, arguments: 3);
                })),
      ],
    ),
  );
  // return Container(
  //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
  //   child: RaisedButton(
  //     onPressed: () {
  //       Helper.requiredLoginFuntion(
  //           context: context,
  //           callBack: () {
  //             Navigator.pushNamed(context, myOrder, arguments: 0);
  //           });
  //     },
  //     // color: Colors.grey[100],
  //     elevation: 0,

  //     padding: EdgeInsets.all(15),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(18.0),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           AppLocalizations.of(context)!.translate("myOrders"),
  //           textScaleFactor: 1.1,
  //           style: TextStyle(
  //             // letterSpacing: 0.5,
  //             color: Colors.black,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Divider(
  //           thickness: 2,
  //         ),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Expanded(
  //               flex: 1,
  //               child: _tile(
  //                   title: AppLocalizations.of(context)!.translate("toPay"),
  //                   icon:
  //BlocBuilder<AuthenticationBloc, AuthenticationState>(
  //                       builder: (context, state) {
  //                     if (state is Authenticated) {
  //                       BlocProvider.of<MyOrderBloc>(context)
  //                           .add(FetchMyOrder());
  //                     }
  //                     return BlocBuilder<MyOrderBloc, MyOrderState>(
  //                       builder: (context, state) {
  //                         if (BlocProvider.of<MyOrderBloc>(context)
  //                                 .orderList
  //                                 .length ==
  //                             0)
  //                           return Icon(
  //                             Icons.attach_money_outlined,
  //                             color: Colors.yellow[800],
  //                           );
  //                         return Badge(
  //                           padding: EdgeInsets.all(4),
  //                           badgeColor: Colors.red,
  //                           badgeContent: Text(
  //                               BlocProvider.of<MyOrderBloc>(context)
  //                                   .orderList
  //                                   .length
  //                                   .toString(),
  //                               textScaleFactor: 0.7,
  //                               style: TextStyle(color: Colors.white)),
  //                           position: BadgePosition.topEnd(top: -8, end: -5),
  //                           child: Icon(
  //                             Icons.attach_money_outlined,
  //                             color: Colors.yellow[800],
  //                           ),
  //                         );
  //                       },
  //                     );
  //                   }),
  //                   onTap: () {
  //                     Navigator.of(context).pushNamed(myOrder, arguments: 0);
  //                   }),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: _tile(
  //                   title: AppLocalizations.of(context)!.translate("paid"),
  //                   icon: Icon(
  //                     Icons.money_outlined,
  //                     color: Colors.green,
  //                   ),
  //                   onTap: () {
  //                     Navigator.of(context).pushNamed(myOrder, arguments: 1);
  //                   }),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: _tile(
  //                   title: AppLocalizations.of(context)!.translate("onDelivery"),
  //                   icon: Icon(
  //                     Icons.drive_eta_outlined,
  //                     color: Colors.yellow[800],
  //                   ),
  //                   onTap: () {
  //                     Navigator.of(context).pushNamed(myOrder, arguments: 2);
  //                   }),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: _tile(
  //                   title: AppLocalizations.of(context)!.translate("completed"),
  //                   icon: Icon(
  //                     Icons.check_circle_outline,
  //                     color: Colors.green,
  //                   ),
  //                   onTap: () {
  //                     Navigator.of(context).pushNamed(myOrder, arguments: 3);
  //                   }),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   ),
  // );
}
