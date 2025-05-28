part of 'tv_player_cubit.dart';

@immutable
sealed class TVPlayerState {}

final class TVPlayerInitial extends TVPlayerState {}

final class TVPlayerLoaded extends TVPlayerState {

  final YoutubePlayerController controller;

  TVPlayerLoaded(this.controller);

}

final class FailuerLoadTVPlayer extends TVPlayerState {
  final String error;

  FailuerLoadTVPlayer(this.error);

}
