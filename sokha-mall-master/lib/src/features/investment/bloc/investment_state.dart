part of 'investment_bloc.dart';

abstract class InvestmentState extends Equatable {
  const InvestmentState();

  @override
  List<Object> get props => [];
}

class InvestmentInitial extends InvestmentState {}

class LoadingInvest extends InvestmentState {}

class Invested extends InvestmentState {}

class ErrorInvest extends InvestmentState {
  final String e;
  ErrorInvest({required this.e});
}
