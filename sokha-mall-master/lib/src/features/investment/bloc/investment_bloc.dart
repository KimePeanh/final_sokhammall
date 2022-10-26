import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:extended_image/extended_image.dart';
import 'package:sokha_mall/src/features/investment/repository/investment_repository.dart';
import 'package:sokha_mall/src/utils/services/api_provider.dart';

part 'investment_event.dart';
part 'investment_state.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentBloc() : super(InvestmentInitial());
  InvestmentRepository _investmentRepository = InvestmentRepository();
  String message = "";
  
  @override
  Stream<InvestmentState> mapEventToState(InvestmentEvent event) async* {
    if (event is InvestPress) {
      yield LoadingInvest();
      try {
        final String _imageUrl = await uploadImage(image: event.imageurl);
        message = await _investmentRepository.investment(
            quantity: event.quantity,
            value: event.value,
            profit_per_year: event.profit_per_year,
            total: event.total,
            open_every_month: event.open_every_month,
            amount_to_be_paid: event.amount_to_be_paid,
            phone_number: event.phone_number,
            note: event.note, imageurl: _imageUrl);
        yield Invested();
      } catch (e) {
        yield ErrorInvest(e: e.toString());
      }
    }
  }
}
