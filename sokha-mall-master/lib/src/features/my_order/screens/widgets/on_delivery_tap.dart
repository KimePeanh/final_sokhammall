import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/main.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

import 'my_order_item_tile.dart';

class OnDeliveryTab extends StatefulWidget {
  @override
  _OnDeliveryTabState createState() => _OnDeliveryTabState();
}

class _OnDeliveryTabState extends State<OnDeliveryTab> {
  @override
  Widget build(BuildContext context) {
    orderByOnDeliveryBloc.add(FetchMyOrder());
    return BlocBuilder(
      bloc: orderByOnDeliveryBloc,
      builder: (context, state) {
        // Helper.handleState(state: state, context: context);
        if (state is FetchingOrder) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorFetchingOrder) {
          Helper.handleState(state: state, context: context);
          return Text(state.error);
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: orderByOnDeliveryBloc.orderList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyOrderItemTile(
                      myOrder: orderByOnDeliveryBloc.orderList[index],
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
