import 'package:flutter/material.dart';
import 'package:sokha_mall/src/features/bonus/screen/bonus_screen.dart';
import 'package:sokha_mall/src/features/wallet/screen/wallet_screen.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

Widget Bonus(context, key) => TextButton(
      onPressed: () {
        Helper.requiredLoginFuntion(
            context: context,
            callBack: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BonusScreen()));
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(AssetImage('assets/icons/gift.png'), color: Theme.of(context).primaryColor),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text("Bonus",
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
