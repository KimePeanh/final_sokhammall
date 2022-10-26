import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/checkout/bloc/checkout_bloc.dart';
import 'package:sokha_mall/src/features/checkout/bloc/checkout_state.dart';
import 'package:sokha_mall/src/features/checkout/screens/widgets/status_card.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

class CheckoutStatusPage extends StatefulWidget {
  @override
  _CheckoutStatusPageState createState() => _CheckoutStatusPageState();
}

class _CheckoutStatusPageState extends State<CheckoutStatusPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is ErrorCheckingOut) {
          try {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 5000),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(bottom: 80, left: 20, right: 20),
                content: Text(state.error.toString())));
            Helper.handleState(state: state, context: context);
          } catch (e) {
            log(e.toString());
          }
        }
      },
      builder: (context, state) {
        // Helper.handleState(state: state, context: context);
        // return StatusCard(
        //   status: Status.Failed,
        // );
        if (state is CheckedOut) {
          return StatusCard(status: Status.Succes);
        }
        if (state is ErrorCheckingOut) {
          return StatusCard(status: Status.Failed);
        }
        return Scaffold(
          body: Center(
            child: Container(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            ),
          ),
        );
      },
    );
  }
}
