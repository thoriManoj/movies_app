import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetComingSoon getComingSoon;
  final GetNowPlaying getNowPlaying;

  MovieTabbedBloc({
    @required this.getPopular,
    @required this.getComingSoon,
    @required this.getNowPlaying,
  }) : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabbedChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (state.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getNowPlaying(NoParams());
          break;
        case 3:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
      yield moviesEither.fold(
          (l) => MovieTabLoadError(currentTabIndex: state.currentTabIndex),
          (movies) {
        return MovieTabChanged(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        );
      });
    }
  }
}
