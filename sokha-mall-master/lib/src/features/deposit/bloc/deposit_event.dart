part of 'deposit_bloc.dart';

@immutable
abstract class DepositEvent {}

class FetchScheduleStart extends DepositEvent {
  final int id;
  FetchScheduleStart({required this.id});
}