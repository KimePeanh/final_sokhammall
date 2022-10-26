import 'package:equatable/equatable.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

abstract class BlogCommentState extends Equatable {
  BlogCommentState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class InitializingCommentList extends BlogCommentState {}

class FetchedCommentList extends BlogCommentState {}

class FetchingCommentList extends BlogCommentState {}

class ProcessingComment extends BlogCommentState {}

class ProcessedComment extends BlogCommentState {}

class AddedComment extends BlogCommentState {}

class ErrorFetchingCommentList extends BlogCommentState with ErrorState {
  final dynamic error;
  ErrorFetchingCommentList({required this.error});
}

class ErrorProcessingComment extends BlogCommentState with ErrorState {
  final dynamic error;
  ErrorProcessingComment({required this.error});
}
