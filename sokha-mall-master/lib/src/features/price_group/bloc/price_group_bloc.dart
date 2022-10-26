import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sokha_mall/src/features/price_group/models/price_group.dart';
import 'package:sokha_mall/src/features/price_group/repositories/price_group_repository.dart';
import 'price_group_event.dart';
import 'price_group_state.dart';

class PriceGroupBloc extends Bloc<PriceGroupEvent, PriceGroupState> {
  int currentIndex = 0;
  PriceGroupRepository _priceGroupRepository = PriceGroupRepository();

  @override
  PriceGroupBloc() : super(FetchingPriceGroup());

  @override
  Stream<PriceGroupState> mapEventToState(PriceGroupEvent event) async* {
    if (event is FetchPriceGroup || event is FetchPriceGroupByStore) {
      yield FetchingPriceGroup();
      try {
        await Future.delayed(Duration(milliseconds: 200));
        List<PriceGroup> priceGroupList =
            await _priceGroupRepository.getPriceGroupList();
        yield FetchedPriceGroup(priceGroupList: priceGroupList);
      } catch (e) {
        yield ErrorFetchingPriceGroup(error: e.toString());
      }
    }
    if (event is ChangeIndex) {
      yield ChangingIndex();
      currentIndex = event.index;
      yield ChangedIndex();
    }
  }
}
