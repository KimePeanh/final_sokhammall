import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/authentication/bloc/authentication_bloc.dart';
import 'package:sokha_mall/src/features/authentication/bloc/authentication_state.dart';
import 'package:sokha_mall/src/features/banner/bloc/index.dart';
import 'package:sokha_mall/src/features/banner/screens/widgets/home_banner_slider.dart';
import 'package:sokha_mall/src/features/category/bloc/index.dart';
import 'package:sokha_mall/src/features/home/screens/widgets/promotion.dart';
import 'package:sokha_mall/src/features/product/bloc/product_listing/product_listing_bloc.dart';
import 'package:sokha_mall/src/features/product/bloc/product_listing/product_listing_event.dart';
import 'package:sokha_mall/src/features/product/bloc/product_listing/product_listing_state.dart';
import 'package:sokha_mall/src/features/product/repositories/product_listing_repository.dart';
import 'package:sokha_mall/src/features/product/screens/widgets/product_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/app_bar.dart';
import 'widgets/home_category.dart';
import 'widgets/home_price_group.dart';
import 'widgets/home_product_list_by_category.dart';

final List<Color?> colorList = [
  Colors.red[100],
  Colors.blue[100],
  Colors.green[100],
  Colors.purple[100],
  Colors.orange[100],
  Colors.lightGreen[100],
  Colors.yellow[100],
  Colors.pink[100],
  Colors.lime[100]
];

class HomePage extends StatelessWidget {
  static ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (c, state) {
        if (state is Authenticating) {
          log("homepage authenticating");
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return BlocProvider(
            create: (BuildContext context) => ProductListingBloc(
                productListingRepository: ProductListRepo(
                    isAuthenticated:
                        (BlocProvider.of<AuthenticationBloc>(context).state
                                is Authenticated
                            ? true
                            : false)))
              ..add(InitializeProductList(arg: null)),
            child: Scaffold(
                //extendBody: true,
                appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, kToolbarHeight),
                  child: appBar(context: context),
                ),
                body: HomeBody()),
          );
        }
      },
    );
  }
}

class HomeBody extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductListingBloc, ProductListingState>(
      listener: (context, state) {
        if (state is InitializedProductList || state is FetchedProductList) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        }
        if (state is EndOfProductList) {
          _refreshController.loadNoData();
        }
      },
      child: SmartRefresher(
        cacheExtent: 1,
        physics: AlwaysScrollableScrollPhysics(),
        onRefresh: () {
          BlocProvider.of<ProductListingBloc>(context)
              .add(InitializeProductList());
          BlocProvider.of<CategoryBloc>(context).add(FetchCategory());
        },
        onLoading: () {
          if (BlocProvider.of<ProductListingBloc>(context).state
              is EndOfProductList) {
          } else {
            BlocProvider.of<ProductListingBloc>(context)
                .add(FetchProductList(arg: null));
          }
        },
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: BlocProvider(
                                  create: (BuildContext context) =>
                                      BannerBloc()..add(FetchStarted()),
                                  child: HomeBannerSlider())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              HomePriceGroup(),
              Container(child: HomeCategory()),
              SizedBox(height: 10),
              BlocProvider(
                  create: (BuildContext context) => ProductListingBloc(
                      productListingRepository: ProductListByPromotionRepo(
                          isAuthenticated:
                              (BlocProvider.of<AuthenticationBloc>(context)
                                      .state is Authenticated
                                  ? true
                                  : false)),
                      rowPerPage: 3)
                    ..add(InitializeProductList()),
                  child: Promotion()),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is FetchingCategory) {
                    return Container();
                  } else if (state is ErrorFetchingCategory) {
                    return Container();
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: BlocProvider.of<CategoryBloc>(context)
                          .category
                          .length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => BlocProvider(
                        create: (BuildContext context) => ProductListingBloc(
                            productListingRepository: ProductListByCategoryRepo(
                                isAuthenticated:
                                    (BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .state is Authenticated
                                        ? true
                                        : false)),
                            rowPerPage: 3)
                          ..add(InitializeProductList(
                              arg: BlocProvider.of<CategoryBloc>(context)
                                  .category[index]
                                  .id)),
                        child: HomeProductListByCategory(
                          category: BlocProvider.of<CategoryBloc>(context)
                              .category[index],
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, right: 0),
                //alignment: Alignment.centerLeft,
                child: Text("Feature",
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Theme.of(context).textTheme.headline1!.color,
                        fontWeight: FontWeight.w500)),
              ),
              ProductList()
            ],
          ),
        ),
      ),
    );
  }
}
