import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/language/bloc/language_bloc.dart';
import 'package:sokha_mall/src/features/language/bloc/language_state.dart';
import 'package:sokha_mall/src/features/language/screens/widgets/language_modal.dart';
import 'package:sokha_mall/src/features/notification/bloc/index.dart';
import 'package:sokha_mall/src/features/notification/screens/notification_page.dart';
// import 'package:sokha_mall/src/features/notification/screens/notification_page.dart';
import 'package:sokha_mall/src/features/search/screens/search_page.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

Widget appBar({required BuildContext context}) {
  double statusBarHeight = MediaQuery.of(context).padding.top;
  // final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return Container(
    // color: Theme.of(context).primaryColor,
    margin: EdgeInsets.all(0),
    width: MediaQuery.of(context).size.width - 30,
    height: double.infinity,
    // color: Theme.of(context).primaryColor,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: statusBarHeight, right: 0, left: 0),
          child: AspectRatio(
            aspectRatio: 1,
            child: FlatButton(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 13, bottom: 13, right: 0, left: 0),
              child: Image(
                image: AssetImage(
                    BlocProvider.of<LanguageBloc>(context).state ==
                            LanguageState(Locale('en', 'US'))
                        ? "assets/icons/countries/usa.png"
                        : (BlocProvider.of<LanguageBloc>(context).state ==
                                LanguageState(Locale('km', 'KH')))
                            ? "assets/icons/countries/cambodia.png"
                            : (BlocProvider.of<LanguageBloc>(context).state ==
                                    LanguageState(Locale('th', 'TH')))
                                ? "assets/icons/countries/thailand.png"
                                : "assets/icons/countries/china.png"),
              ),
              onPressed: () {
                languageModal(context);
              },
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: SearchPage());
            },
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:
                      BorderRadius.all(Radius.circular(searchBarBorderRadius))),
              margin: EdgeInsets.only(
                  left: 0, top: statusBarHeight + 12, right: 0, bottom: 12),
              child: Card(
                margin: EdgeInsets.only(left: 0),
                color: Colors.grey[200],
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(searchBarBorderRadius),
                ),
                //margin: EdgeInsets.all(0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.translate("search") +
                          " Sokha Mall",
                      style: TextStyle(color: Colors.black),
                      textScaleFactor: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
        Container(
            margin: EdgeInsets.only(top: statusBarHeight),
            child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (c, state) {
              return Badge(
                // showBadge: BlocProvider.of<NotificationBloc>(context).isRead
                //     ? false
                //     : true,
                showBadge: false,
                position: BadgePosition.topEnd(top: 3, end: 10),
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                badgeContent: Text(
                  " ",
                  textScaleFactor: 0.5,
                ),
                child: IconButton(
                    // color: Colors.,
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () async {
                      BlocProvider.of<NotificationBloc>(context)
                          .add(SetReadingStatus(isRead: true));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                    }),
              );
            })),
        SizedBox(
          width: 5,
        ),
        // Container(
        //     margin: EdgeInsets.only(top: statusBarHeight, right: 0),
        //     child: AspectRatio(
        //       aspectRatio: 1,
        //       child: FittedBox(
        //         fit: BoxFit.fitHeight,
        //         child: IconButton(
        //             padding: EdgeInsets.all(0),
        //             icon: Icon(Icons.notifications, color: Colors.white),
        //             onPressed: null),
        //       ),
        //     )),
      ],
    ),
  );
}
