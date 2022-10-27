import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sokha_mall/src/features/deposit/repository/deposit_repository.dart';
import 'package:sokha_mall/src/features/investment/model/investment_model.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc() : super(DepositInitial());
  DepositRepository _depositRepository = DepositRepository();
  int total = 0;

  List<DepositModel> deposit_list = [];

  @override
  Stream<DepositState> mapEventToState(DepositEvent event) async* {
    if (event is FetchScheduleStart) {
      yield FetchingDeposit();
      try {
        total = await _depositRepository.total;
        deposit_list = await _depositRepository.getDepositSchedule(
            rowperpage: total, page: 1, id: event.id);
        yield FetchedDeposit();
      } catch (e) {
        yield ErrorFetchDepost(e: e.toString());
      }
    }
  }
}
