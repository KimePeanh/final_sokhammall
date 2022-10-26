import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class NotificationState extends Equatable {
  NotificationState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchingNotification extends NotificationState {}

class FetchedNotification extends NotificationState {}

class ErrorInitializingNotification extends NotificationState {
  final String error;
  ErrorInitializingNotification({required this.error});
}

class ErrorFetchingNotification extends NotificationState {
  final String error;
  ErrorFetchingNotification({required this.error});
}
