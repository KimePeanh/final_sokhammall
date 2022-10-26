import 'package:equatable/equatable.dart';

abstract class PriceGroupEvent extends Equatable {
  PriceGroupEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchPriceGroup extends PriceGroupEvent {}

class FetchPriceGroupByStore extends PriceGroupEvent {
  final String storeId;
  FetchPriceGroupByStore({required this.storeId});
}

class ChangeIndex extends PriceGroupEvent {
  final int index;
  ChangeIndex({required this.index});
}
