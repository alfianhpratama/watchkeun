import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_state.dart';

part 'top_rated_movies_cubit.freezed.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMoviesCubit({required this.getTopRatedMovies})
      : super(const TopRatedMoviesState());

  Future<void> fetchTopRatedMovies() async {
    emit(state.copyWith(state: RequestState.loading));

    final result = await getTopRatedMovies.execute();

    result.fold(
      (failure) => emit(state.copyWith(
        state: RequestState.error,
        message: failure.message,
      )),
      (moviesData) => emit(state.copyWith(
        state: RequestState.loaded,
        movies: moviesData,
      )),
    );
  }
}
