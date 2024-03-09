import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/search_movies.dart';

part 'movie_search_state.dart';

part 'movie_search_cubit.freezed.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final SearchMovies searchMovies;

  MovieSearchCubit({required this.searchMovies})
      : super(const MovieSearchState());

  Future<void> fetchMovieSearch(String query) async {
    emit(state.copyWith(state: RequestState.loading));

    final result = await searchMovies.execute(query);
    result.fold(
      (failure) => emit(state.copyWith(
        state: RequestState.error,
        message: failure.message,
      )),
      (data) => emit(state.copyWith(
        state: RequestState.loaded,
        searchResult: data,
      )),
    );
  }
}
