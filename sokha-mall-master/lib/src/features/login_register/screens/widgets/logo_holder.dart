import 'package:flutter/material.dart';

Widget logoHolder() => Row(
      children: [
        Expanded(flex: 25, child: Container()),
        Expanded(
            flex: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: Color(0xFF00a652),
                padding: EdgeInsets.all(15),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: FittedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              image: AssetImage(
                                  "assets/images/ic_launcher.jpg")))),
                ),
              ),
            )),
        Expanded(flex: 25, child: Container()),
      ],
    );
