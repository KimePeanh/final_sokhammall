part of 'investment_bloc.dart';

abstract class InvestmentEvent extends Equatable {
  const InvestmentEvent();

  @override
  List<Object> get props => [];
}

class InvestPress extends InvestmentEvent {
  final int quantity;
  final String value;
  final String profit_per_year;
  final String total;
  final int open_every_month;
  final String amount_to_be_paid;
  final String phone_number;
  final String note;
  final File imageurl;

  InvestPress(
      {required this.quantity,
      required this.value,
      required this.profit_per_year,
      required this.total,
      required this.open_every_month,
      required this.amount_to_be_paid,
      required this.phone_number,
      required this.note, required this.imageurl});
}
