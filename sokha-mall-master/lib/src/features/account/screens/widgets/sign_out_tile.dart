import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/cart/bloc/index.dart';

Widget signOutTile(context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  title: Text(
                      AppLocalizations.of(context)!.translate('logOutPrompt')),
                  content: Text(AppLocalizations.of(context)!
                      .translate('logOutQuestion')),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                          AppLocalizations.of(context)!.translate('cancel')),
                    ),
                    FlatButton(
                      onPressed: () {
                        // SystemChannels.platform

                        //     .invokeMethod('SystemNavigator.pop');

                        Navigator.of(context).pop(false);

                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LogoutPressed());

                        BlocProvider.of<CartBloc>(context).add(LogoutCart());
                      },
                      child: Text(
                          AppLocalizations.of(context)!.translate('logOut'),
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              });
        },
        child: Center(
          child: Text(AppLocalizations.of(context)!.translate("logOut"),
              textScaleFactor: 1.1,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.red)),
        ),
      ),
    );
