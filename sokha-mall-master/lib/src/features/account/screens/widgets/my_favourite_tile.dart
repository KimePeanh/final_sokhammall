import 'package:flutter/material.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/config/routes/routes.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

Widget favouriteTile(context, key) => TextButton(
      onPressed: () {
        Helper.requiredLoginFuntion(
            context: context,
            callBack: () {
              Navigator.pushNamed(context, favourite);
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.favorite, color: Theme.of(context).primaryColor),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(AppLocalizations.of(context)!.translate("favourite"),
                textScaleFactor: 1,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.button
                // style: TextStyle(
                //     // letterSpacing: 0.5,
                //     color: Theme.of(context).textTheme.headline1!.color),
                ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          )
        ],
      ),
    );
