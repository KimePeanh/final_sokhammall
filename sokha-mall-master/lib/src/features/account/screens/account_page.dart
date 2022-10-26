import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/account/bloc/contact/contact_bloc.dart';
import 'package:sokha_mall/src/features/account/screens/widgets/bonus.dart';
import 'package:sokha_mall/src/features/account/screens/widgets/investment_wallet_tile.dart';
import 'package:sokha_mall/src/features/account/screens/widgets/my_favourite_tile.dart';
import 'package:sokha_mall/src/features/account/screens/widgets/wallet_tile.dart';

import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/account/bloc/index.dart';
import 'package:sokha_mall/src/shared/widgets/login_button.dart';
import 'package:sokha_mall/src/shared/widgets/register_button.dart';
import 'widgets/Information_tile.dart';

import 'widgets/address_tile.dart';
import 'widgets/contact_us_tile.dart';

import 'widgets/my_order_tile.dart';
import 'widgets/sign_out_tile.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (contextt, state) {
      if (state is Authenticated) {
        BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
        return BodyBuilder();
      } else if (state is NotAuthenticated) {
        //return Text("j");
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginButton(context: context),
              SizedBox(height: 15),
              registerButton(context: context),
              SizedBox(height: 15),
              BlocProvider(
                  create: (BuildContext context) {
                    return ContactBloc();
                  },
                  child: contactUs()),
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}

class BodyBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey _key = GlobalKey();

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 56),
        InformationTile(),
        SizedBox(height: 25),
        myOrderTile(context),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              wallet(context, key),
              SizedBox(height: 10,),
              Bonus(context, key),
              SizedBox(height: 10,),
              favouriteTile(context, key),
              SizedBox(height: 10),
              
              myAddressTile(context),
              SizedBox(height: 10),
              BlocProvider(
                  create: (BuildContext context) {
                    return ContactBloc();
                  },
                  child: contactUs()),
            ],
          ),
        ),
        SizedBox(height: 25),
        signOutTile(context)
      ],
    ));
  }
}
