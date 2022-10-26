import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sokha_mall/src/features/price_group/models/price_group.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';
import 'package:sokha_mall/src/utils/services/custom_exception.dart';

class PriceGroupRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<List<PriceGroup>> getPriceGroupList() async {
    String url = "${dotenv.env['baseUrl']}/price_groups";
    try {
      Response response = (await apiProvider.get(url, null, null))!;
      if (response.statusCode == 200) {
        List<PriceGroup> priceGroupList = [];
        response.data["data"].forEach((data) {
          priceGroupList.add(PriceGroup.fromJson(data));
        });
        return priceGroupList;
      }
      throw CustomException.generalException();
    } catch (error) {
      throw error;
    }
  }
}
