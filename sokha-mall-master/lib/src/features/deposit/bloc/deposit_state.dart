part of 'deposit_bloc.dart';

@immutable
abstract class DepositState {}

class DepositInitial extends DepositState {}

class FetchingDeposit extends DepositState{}

class FetchedDeposit extends DepositState {} 

class ErrorFetchDepost extends DepositState {
  final String e;
  ErrorFetchDepost({required this.e});
}