import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:sokha_mall/src/features/category/models/category_content.dart';

@immutable
abstract class CategoryContentState extends Equatable {
  CategoryContentState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchingCategoryContent extends CategoryContentState {}

class FetchedCategoryContent extends CategoryContentState {
  final CategoryContent categoryContent;
  FetchedCategoryContent({required this.categoryContent});
}

class ErrorFetchingCategoryContent extends CategoryContentState {
  final String error;
  ErrorFetchingCategoryContent({required this.error});
}
