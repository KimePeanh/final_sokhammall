import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/shared/widgets/error_snackbar.dart';
import 'package:sokha_mall/src/shared/widgets/full_screen_image.dart';
import 'package:sokha_mall/src/shared/widgets/standard_appbar.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';
import 'widgets/order_detail_item_tile.dart';

class OrderDetailPage extends StatefulWidget {
  final String orderId;
  OrderDetailPage({required this.orderId});
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetailPage> {
  late MyOrderBloc _myOrderBloc;
  @override
  void initState() {
    _myOrderBloc = MyOrderBloc(orderRepository: null);
    _myOrderBloc.add(FetchMyOrderDetail(orderId: widget.orderId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: standardAppBar(context, ""),
      body: BlocListener(
        bloc: _myOrderBloc,
        listener: (context, state) {
          if (state is ErrorFetchingOrder) {
            Helper.handleState(state: state, context: context);
            errorSnackBar(text: state.error, context: context);
          }
        },
        child: BlocBuilder(
            bloc: _myOrderBloc,
            builder: (context, state) {
              if (state is FetchingOrder) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ErrorFetchingOrder) {
                Helper.handleState(state: state, context: context);
                return TextButton(onPressed: () {}, child: Text("Retry"));
              } else {
                return ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.translate("orderDetail"),
                        //AppLocalizations.of(context)!.translate("language"),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                        textScaleFactor: 1.8,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ..._myOrderBloc.orderHistoryDetail.orderItems
                        .map((order) => orderDetailItemTile(orderItem: order)),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate("orderSummary"),
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey[100],
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.translate("orderId")}: ${_myOrderBloc.orderHistoryDetail.summary.id}",
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.translate("total")}: ",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                      "${_myOrderBloc.orderHistoryDetail.summary.grandTotal}",
                                      style: TextStyle(color: Colors.red[300])),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.translate("subtotal")}: ",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                      "${_myOrderBloc.orderHistoryDetail.summary.total}",
                                      style: TextStyle(color: Colors.red[300])),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.translate("deliveryFee")}: ",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                      "${_myOrderBloc.orderHistoryDetail.summary.deliveryFee}",
                                      style: TextStyle(color: Colors.red[300])),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.translate("date")}: ${_myOrderBloc.orderHistoryDetail.summary.date}",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Text("Address: ${orderHistoryBloc.orderList[index].address}"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.translate("address")}: ${_myOrderBloc.orderHistoryDetail.summary.address}",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.translate("status")}: ${_myOrderBloc.orderHistoryDetail.summary.status}",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    // Image(
                    //   // errorBuilder: (context, error, stackTrace) =>
                    //   //     Container(),
                    //   image: NetworkImage(
                    //       _myOrderBloc.orderHistoryDetail.transactionImage),
                    // ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: (_myOrderBloc
                                  .orderHistoryDetail.transactionImage ==
                              null)
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreenImage(
                                            imageUrl: _myOrderBloc
                                                .orderHistoryDetail
                                                .transactionImage!,
                                          )),
                                );
                              },
                              child: Hero(
                                tag: _myOrderBloc
                                    .orderHistoryDetail.transactionImage!,
                                child: Image(
                                  // loadingBuilder:
                                  //     (context, error, stackTrace) =>
                                  //         CircularProgressIndicator(),
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(),
                                  image: NetworkImage(_myOrderBloc
                                      .orderHistoryDetail.transactionImage!),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 20),
                    (_myOrderBloc.orderHistoryDetail.summary.imageSeller ==
                            null)
                        ? Center()
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(AppLocalizations.of(context)!
                                    .translate("sellerImage")),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScreenImage(
                                                imageUrl: _myOrderBloc
                                                    .orderHistoryDetail
                                                    .summary
                                                    .imageSeller!,
                                              )),
                                    );
                                  },
                                  child: Hero(
                                    tag: _myOrderBloc
                                        .orderHistoryDetail.transactionImage!,
                                    child: Image(
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        log(_myOrderBloc.orderHistoryDetail
                                            .summary.imageSeller!);
                                        return Container();
                                      },
                                      image: NetworkImage(_myOrderBloc
                                          .orderHistoryDetail
                                          .summary
                                          .imageSeller!),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          )
                  ],
                );
              }
            }),
      ),
    );
  }

  @override
  void dispose() {
    _myOrderBloc.close();
    super.dispose();
  }
}
