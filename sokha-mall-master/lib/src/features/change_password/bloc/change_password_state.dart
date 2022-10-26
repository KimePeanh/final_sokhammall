import 'package:equatable/equatable.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

abstract class ChangePasswordState extends Equatable {
  ChangePasswordState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class ChangeFailed extends ChangePasswordState with ErrorState {
  final dynamic error;

  ChangeFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class Changed extends ChangePasswordState {
  Changed({required this.accessToken});
  final String accessToken;
}

class Changing extends ChangePasswordState {}

class Initializing extends ChangePasswordState {}
