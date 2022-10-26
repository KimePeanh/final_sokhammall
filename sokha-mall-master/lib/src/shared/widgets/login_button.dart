import 'package:flutter/material.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/config/routes/routes.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

Widget loginButton({required BuildContext context}) => Container(
      width: double.infinity,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(standardBorderRadius),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, loginRegister, arguments: true);
          },
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            AppLocalizations.of(context)!.translate("logIn"),
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.white),
          )),
    );
