import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/my_order/bloc/index.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

import 'my_order_item_tile.dart';

class CompletedTab extends StatefulWidget {
  @override
  _CompletedTabState createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MyOrderBloc>(context).add(FetchMyOrder());
    return BlocBuilder<MyOrderBloc, MyOrderState>(
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
              itemCount: BlocProvider.of<MyOrderBloc>(context).orderList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyOrderItemTile(
                      myOrder: BlocProvider.of<MyOrderBloc>(context)
                          .orderList[index],
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
