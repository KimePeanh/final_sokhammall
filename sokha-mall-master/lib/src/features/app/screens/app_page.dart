import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/blog/screens/blog_page.dart';
import 'package:sokha_mall/src/features/cart/screens/cart_page.dart';
import 'package:sokha_mall/src/features/category/screens/category_page.dart';
import 'package:sokha_mall/src/features/home/screens/home_page.dart';
import 'package:sokha_mall/src/features/account/screens/account_page.dart';
import 'package:sokha_mall/src/features/investment/screen/investment.dart';

import 'package:sokha_mall/src/shared/bloc/indexing/index.dart';
import 'package:sokha_mall/src/shared/bloc/invoking/invoking_bloc.dart';

import 'widgets/bottom_navigation_bar.dart';

IndexingBloc bottomNavigationIndexBloc = IndexingBloc();

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  static List<InvokingBloc> bottomNavigationPagesInvokingBloc = [
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
  ];

  final List<Widget> bottomNavigationPages = [
    HomePage(),
    CategoryPage(),
    InvestmentScreen(),
    CartPageWrapper(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
          bloc: bottomNavigationIndexBloc,
          builder: (BuildContext context, int? state) {
            return IndexedStack(
              index: state,
              children: this.bottomNavigationPages,
            );
          },
        ),
        bottomNavigationBar: AppBottomNavigationBar());
  }

  @override
  void dispose() {
    bottomNavigationIndexBloc.close();
    bottomNavigationPagesInvokingBloc.forEach((bloc) {
      bloc.close();
    });
    super.dispose();
  }
}
