import 'package:sokha_mall/src/features/price_group/models/price_group.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PriceGroupState extends Equatable {
  PriceGroupState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchingPriceGroup extends PriceGroupState {}

class FetchedPriceGroup extends PriceGroupState {
  final List<PriceGroup> priceGroupList;
  FetchedPriceGroup({required this.priceGroupList});
}

class ErrorFetchingPriceGroup extends PriceGroupState {
  final String error;
  ErrorFetchingPriceGroup({required this.error});
}

class ChangingIndex extends PriceGroupState {}

class ChangedIndex extends PriceGroupState {}
