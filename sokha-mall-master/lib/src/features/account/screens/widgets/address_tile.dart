import 'package:flutter/material.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/config/routes/routes.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

Widget myAddressTile(BuildContext context) => TextButton(
      // padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      onPressed: () {
        Helper.requiredLoginFuntion(
            context: context,
            callBack: () {
              Navigator.pushNamed(context, shippingAddress, arguments: true);
            });
      },

      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.location_city, color: Theme.of(context).primaryColor),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                  AppLocalizations.of(context)!.translate("shippingAddresses"),
                  textScaleFactor: 1,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.button),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
