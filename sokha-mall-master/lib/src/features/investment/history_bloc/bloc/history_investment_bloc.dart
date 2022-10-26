import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sokha_mall/src/features/investment/model/investment_model.dart';
import 'package:sokha_mall/src/features/investment/repository/investment_repository.dart';

part 'history_investment_event.dart';
part 'history_investment_state.dart';

class HistoryInvestmentBloc
    extends Bloc<HistoryInvestmentEvent, HistoryInvestmentState> {
  HistoryInvestmentBloc() : super(HistoryInvestmentInitial());
  InvestmentRepository _investmentRepository = InvestmentRepository();
  List<InvestmentModel> invest_list = [];
  int rowperpage = 12;
  late int page;

  @override
  Stream<HistoryInvestmentState> mapEventToState(
      HistoryInvestmentEvent event) async* {
    if (event is StartFetchingHis) {
      yield FetchingInvestHis();
      page = 1;
      try {
        invest_list = await _investmentRepository.getInvestmenthistory(
            rowperpage: rowperpage, page: page);
        page++;
        yield FetchedInvestHis();
      } catch (e) {
        yield ErrorInvestHis(e: e.toString());
      }
    }
    if (event is ReloadEvent) {
      yield reloading();
      try {
        List<InvestmentModel> _temp = await _investmentRepository
            .getInvestmenthistory(rowperpage: rowperpage, page: page);
        invest_list.addAll(_temp);
        page++;
        if (_temp.length < rowperpage) {
          yield EndofHistoryInvest();
        } else {
          yield FetchedInvestHis();
        }
      } catch (e) {
        yield ErrorInvestHis(e: e.toString());
      }
    }
  }
}
