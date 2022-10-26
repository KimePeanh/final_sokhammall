import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/price_group/bloc/price_group_bloc.dart';
import 'package:sokha_mall/src/features/price_group/bloc/price_group_state.dart';
import 'package:sokha_mall/src/features/price_group/models/price_group.dart';
import 'package:sokha_mall/src/features/product/screens/product_list_by_price_group.dart';

class HomePriceGroup extends StatelessWidget {
  const HomePriceGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceGroupBloc, PriceGroupState>(
      builder: (c, state) {
        if (state is FetchedPriceGroup) {
          return Container(
            margin: EdgeInsets.only(top: 15, bottom: 0, right: 10, left: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 10 / 7),
              // itemCount: state.priceGroupList.length > 4
              //     ? 4
              //     : state.priceGroupList.length,
              itemCount: state.priceGroupList.length,
              padding: EdgeInsets.all(4.0),
              itemBuilder: (context, index) {
                return _tile(context, state.priceGroupList[index]);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _tile(BuildContext context, PriceGroup priceGroup) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductListByPriceGroupPage(priceGroup: priceGroup);
          },
        ));
      },
      child: Column(
        children: [
          Expanded(
            flex: 80,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ExtendedImage.network(
                  priceGroup.image,
                  // width: ScreenUtil.instance.setWidth(400),
                  // height: ScreenUtil.instance.setWidth(400),
                  // errorBuilder: Image.asset(
                  //     "assets/images/product_placeholder.jpg"),
                  errorWidget:
                      Image.asset("assets/images/product_placeholder.jpg"),
                  enableMemoryCache: true,
                  clearMemoryCacheWhenDispose: true,
                  clearMemoryCacheIfFailed: false,
                  fit: BoxFit.cover,
                  cache: true,
                  // width: 350,
                  cacheHeight: 350,

                  // border: Border.all(color: Colors.red, width: 1.0),
                  // shape: boxShape,
                  // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //cancelToken: cancellationToken,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              flex: 20,
              child: Text(priceGroup.name,
                  maxLines: 1,
                  style: TextStyle(
                      height: 1.5,
                      letterSpacing: 0,
                      color: Theme.of(context).textTheme.headline1!.color
                      // fontWeight: FontWeight.w300
                      )))
        ],
      ),
    );
  }
}
