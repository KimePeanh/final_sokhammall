part of 'history_investment_bloc.dart';

@immutable
abstract class HistoryInvestmentState {}

class HistoryInvestmentInitial extends HistoryInvestmentState {}


class FetchingInvestHis extends HistoryInvestmentState{}

class FetchedInvestHis extends HistoryInvestmentState{}

class ErrorInvestHis extends HistoryInvestmentState{
  final String e;
  ErrorInvestHis({required this.e});
}

class reloading extends HistoryInvestmentState{}

class EndofHistoryInvest extends HistoryInvestmentState {}
