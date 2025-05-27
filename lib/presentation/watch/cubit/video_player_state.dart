part of 'video_player_cubit.dart';

@immutable
sealed class VideoPlayerState {}

final class VideoPlayerInitial extends VideoPlayerState {}

final class FailuerLoadVideo extends VideoPlayerState {
  final String error;

  FailuerLoadVideo(this.error);
}

final class VideoLoaded extends VideoPlayerState {
  final YoutubePlayerController controller;

  VideoLoaded(this.controller);
}