import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/features/my_order/repositories/my_order_respository.dart';
import 'package:sokha_mall/src/features/my_order/screens/widgets/completed_tap.dart';
import 'package:sokha_mall/src/features/my_order/screens/widgets/on_delivery_tap.dart';

import 'widgets/paid_tap.dart';
import 'widgets/to_pay_tap.dart';

class MyOrderPage extends StatelessWidget {
  MyOrderPage({required this.initIndex});
  final int initIndex;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initIndex,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          brightness: Theme.of(context).brightness,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.translate("myOrders"),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textScaleFactor: 1.1,
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.translate("toPay"),
              ),
              Tab(text: AppLocalizations.of(context)!.translate("paid")),
              Tab(text: AppLocalizations.of(context)!.translate("onDelivery")),
              Tab(text: AppLocalizations.of(context)!.translate("completed")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ToPayTab(),
            PaidTab(),
            OnDeliveryTab(),
            BlocProvider(
                create: (context) =>
                    MyOrderBloc(orderRepository: OrderByCompletedRepo())
                      ..add(FetchMyOrder()),
                child: CompletedTab()),
          ],
        ),
      ),
    );
  }
}
