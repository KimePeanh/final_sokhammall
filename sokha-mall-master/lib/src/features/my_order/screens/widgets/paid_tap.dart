import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/main.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

import 'my_order_item_tile.dart';

class PaidTab extends StatefulWidget {
  @override
  _PaidTabState createState() => _PaidTabState();
}

class _PaidTabState extends State<PaidTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orderByPaidBloc.add(FetchMyOrder());
    return BlocBuilder(
      bloc: orderByPaidBloc,
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
              itemCount: orderByPaidBloc.orderList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyOrderItemTile(
                      myOrder: orderByPaidBloc.orderList[index],
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
