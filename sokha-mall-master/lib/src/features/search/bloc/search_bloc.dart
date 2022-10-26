import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/product/models/product.dart';
import 'package:sokha_mall/src/features/search/repositories/search_repository.dart';

import 'index.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  String query = "";
  int searchPageIndex = 0;
  List<Product> results = [];
  SearchRepository _searchRepository = SearchRepository();
  @override
  SearchBloc() : super(Initializing());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchHistory) {
      yield Initializing();
      List<String> _history = await _searchRepository.getHistory();
      yield FetchedHistory(history: _history);
    }
    if (event is SearchStarted) {
      try {
        if (event.query != query) {
          query = event.query;
          searchPageIndex = 1;
          yield Searching();
        } else {
          yield Searching(isInitiallySearch: false);
          searchPageIndex++;
        }
        List<Product> tempResults = await _searchRepository.searchProduct(
            page: searchPageIndex, query: event.query);
        results.addAll(tempResults);

        yield Searched();
      } catch (e) {
        yield ErrorSearching(error: e.toString());
      }
    }
  }
}
