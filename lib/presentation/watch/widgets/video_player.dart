import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../cubit/video_player_cubit.dart';

class VideoPlayer extends StatelessWidget {

  final int movieId;

  const VideoPlayer({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => VideoPlayerCubit()..getVideo(movieId),
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) {

          if (state is FailuerLoadVideo) {
            return Center(child: Text(state.error),);
          }

          if (state is VideoPlayerInitial) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (state is VideoLoaded) {
            return YoutubePlayer(controller: state.controller, showVideoProgressIndicator: true,);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}