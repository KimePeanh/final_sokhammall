import 'package:dio/dio.dart';
import 'package:sokha_mall/src/features/investment/model/investment_model.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';
import 'package:sokha_mall/src/utils/services/custom_exception.dart';

class DepositRepository {
  ApiProvider apiProvider = ApiProvider();
  int total = 0;

  Future<List<DepositModel>> getDepositSchedule(
      {required int rowperpage, required int page, required int id}) async {
    String url =
        "http://sokha-mall.anakutjobs.com/anakut/public/api/deposits/?row_per_page=$rowperpage&page=$page&investment_id=$id";
    try {
      Response response = (await apiProvider.get(url, null, null))!;
      if (response.statusCode == 200 || response.data['code'] == 0) {
        List<DepositModel> _temp = [];
        response.data['data'].forEach((data) {
          _temp.add(DepositModel.fromjson(data));
        });
        return _temp;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e.toString();
    }
  }
}
