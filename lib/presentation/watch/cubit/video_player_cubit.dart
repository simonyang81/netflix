
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/entities/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/movie/usecases/get_video.dart';
import '../../../service_locator.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(VideoPlayerInitial());


  void getVideo(int movieId) async {

    var returnedData = await sl<GetVideoUseCase>().call(params: movieId);

    returnedData.fold(
      (error) {
        emit(FailuerLoadVideo(error));
      },
      (data) {

        List<VideoEntity> videos = data;
        for (var video in videos) {
          if (video.site == 'YouTube' && video.key != null && video.key != '') {

            YoutubePlayerController controller = YoutubePlayerController(
              initialVideoId: video.key!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
              ),
            );

            return emit(VideoLoaded(controller));

          }
        }

        emit(FailuerLoadVideo('没有找到影片预览'));

      }
    );

  }

}

