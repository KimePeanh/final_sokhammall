import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/config/routes/routes.dart';
import 'package:sokha_mall/src/features/my_order/models/my_order.dart';

class MyOrderItemTile extends StatelessWidget {
  MyOrderItemTile({required this.myOrder});
  final MyOrder myOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        // color: Colors.grey[100],
        // padding: EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.translate("orderId")}: ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(myOrder.id,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.translate("total")}: ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text("${myOrder.grandTotal}",
                      style: TextStyle(color: Colors.red[300])),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${AppLocalizations.of(context)!.translate("date")}: ${myOrder.date}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${AppLocalizations.of(context)!.translate("address")}: ${myOrder.address}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${AppLocalizations.of(context)!.translate("status")}: ${myOrder.status}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, orderDetail, arguments: myOrder.id);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => OrderDetailPage(
          //             accessToken: accessToken,
          //             orderId: myOrder.id,
          //           )),
          // );
        },
      ),
    );
  }
}
