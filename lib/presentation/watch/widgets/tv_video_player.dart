import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../cubit/tv_player_cubit.dart';

class TVVideoPlayer extends StatelessWidget {
  final int tvId;

  const TVVideoPlayer({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TVPlayerCubit()..getTVVideo(tvId),
      child: BlocBuilder<TVPlayerCubit, TVPlayerState>(
        builder: (context, state) {
          if (state is FailuerLoadTVPlayer) {
            return Center(child: Text(state.error));
          }

          if (state is TVPlayerInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TVPlayerLoaded) {
            return YoutubePlayer(
              controller: state.controller,
              showVideoProgressIndicator: true,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
