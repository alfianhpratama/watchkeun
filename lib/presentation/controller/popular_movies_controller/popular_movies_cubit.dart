import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_popular_movies.dart';

part 'popular_movies_state.dart';

part 'popular_movies_cubit.freezed.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesCubit({required this.getPopularMovies})
      : super(const PopularMoviesState());

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(state: RequestState.loading));

    final result = await getPopularMovies.execute();

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
