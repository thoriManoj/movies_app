part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabbedChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;
  MovieTabbedChangedEvent({
    this.currentTabIndex = 0,
  });

  @override
  List<Object> get props => [currentTabIndex];
}
