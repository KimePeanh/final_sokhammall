import 'package:flutter/material.dart';
import 'package:sokha_mall/src/appLocalizations.dart';

import '../login_register_page.dart';

dialogChooseCountry(BuildContext context, onTaped(index)) {
  return showDialog<void>(
      context: context,
      builder: (context) => SimpleDialog(
            title: Text(
              AppLocalizations.of(context)!.translate("chooseCountry"),
            ),
            titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
            contentPadding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 16.0),
            children: [
              ...countries
                  .map((country) => Container(
                          child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          onTaped(countries.indexOf(country));
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(country["image"]),
                                width: 35,
                                height: 35),
                            SizedBox(width: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .translate(country["name"]),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  SizedBox(height: 5),
                                  Text(country["code"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ])
                          ],
                        ),
                      )))
                  .toList()
            ],
          ));
}
