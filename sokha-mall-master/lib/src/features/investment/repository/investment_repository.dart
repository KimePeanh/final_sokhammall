import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sokha_mall/src/features/investment/model/investment_model.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';
import 'package:sokha_mall/src/utils/services/custom_exception.dart';

class InvestmentRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<String> investment(
      {required int quantity,
      required String value,
      required String profit_per_year,
      required String total,
      required int open_every_month,
      required String amount_to_be_paid,
      required String phone_number,
      required String note,
      required String imageurl}) async {
    String url =
        "http://sokha-mall.anakutjobs.com/anakut/public/api/investments/add";
    Map body = {
      "quantity": quantity,
      "value": value,
      "profit_per_year": profit_per_year,
      "total": total,
      "open_every_month": open_every_month,
      "amount_to_be_paid": amount_to_be_paid,
      "attachment": imageurl,
      "phone_number": phone_number,
      "note": note,
    };
    try {
      Response response = (await apiProvider.post(url, body, null))!;
      if (response.statusCode == 200 || response.data['code'] == 0) {
        // log(response.data);
        return response.data['message'];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<InvestmentModel>> getInvestmenthistory(
      {required int rowperpage, required int page}) async {
    String url =
        "http://sokha-mall.anakutjobs.com/anakut/public/api/investments?row_per_page=$rowperpage&page=$page";
    try {
      Response response = (await apiProvider.get(url, null, null))!;
      if (response.statusCode == 200 || response.data['code']) {
        List<InvestmentModel> _temp = [];
        response.data['data'].forEach((data) {
          _temp.add(InvestmentModel.fromjson(data));
        });
        return _temp;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e.toString();
    }
  }
}
