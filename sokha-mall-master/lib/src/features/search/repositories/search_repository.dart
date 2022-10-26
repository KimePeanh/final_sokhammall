import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sokha_mall/src/features/product/models/product.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';
import 'package:sokha_mall/src/utils/services/custom_exception.dart';
import 'package:sokha_mall/src/utils/services/storage.dart';

class SearchRepository {
  ApiProvider apiProvider = ApiProvider();
  Storage storage = Storage();
  Future<List<Product>> searchProduct(
      {required int page, required String query}) async {
    final String url =
        "${dotenv.env['baseUrl']}/products?page=$page&row_per_page=10&name=$query";
    try {
      Response response = (await apiProvider.get(url, null, null))!;

      if (response.statusCode == 200) {
        List<Product> products = [];
        response.data["data"].forEach((val) {
          products.add(Product.fromJson(val));
        });

        return products;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  getHistory() {}

  // Future<List<String>> getHistory() async {
  //   String searchHistory = await storage.getSearchHistory();

  //   if (searchHistory == null) {
  //     return [];
  //   }
  //   return Helper.convertStringtoListString(data: searchHistory);
  // }
}
