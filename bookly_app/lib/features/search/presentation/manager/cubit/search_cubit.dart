import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String subName}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(subName: subName);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
