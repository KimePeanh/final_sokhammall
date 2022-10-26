import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sokha_mall/src/features/category/models/category.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';

class CategoryDetailRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<Category> getCategory({required String categoryId}) async {
    String url = "${dotenv.env['baseUrl']}/categories/$categoryId";
    try {
      Response response = (await apiProvider.get(url, null, null))!;
      return Category.fromJson(response.data["data"]);
    } catch (error) {
      throw error;
    }
  }
}
