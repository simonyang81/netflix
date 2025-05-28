part of 'personal_movies_cubit.dart';

@immutable
sealed class PersonalMoviesState {}

final class PersonalMoviesInitial extends PersonalMoviesState {}

final class PersonalMoviesLoaded extends PersonalMoviesState {

  final PersonEntity? person;
  final List<MovieEntity>? personalMovies;
  PersonalMoviesLoaded(this.person, this.personalMovies);

}

final class FailureLoadPersonalMovies extends PersonalMoviesState {
  final String errorMessage;
  FailureLoadPersonalMovies(this.errorMessage);
}
