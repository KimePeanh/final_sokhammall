part of 'history_investment_bloc.dart';

@immutable
abstract class HistoryInvestmentEvent {}

class StartFetchingHis extends HistoryInvestmentEvent {}

class ReloadEvent extends HistoryInvestmentEvent{}