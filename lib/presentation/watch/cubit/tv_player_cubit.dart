
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/tv/entities/tv_video.dart';
import '../../../domain/tv/usecases/get_tv_video.dart';
import '../../../service_locator.dart';

part 'tv_player_state.dart';

class TVPlayerCubit extends Cubit<TVPlayerState> {
  TVPlayerCubit() : super(TVPlayerInitial());


  void getTVVideo(int seriesId) async {
    var returnedData = await sl<GetTVVideoUseCase>().call(params: seriesId);

    returnedData.fold(
      (error) {
        emit(FailuerLoadTVPlayer(error));
      },
      (data) {

        List<TVVideoEntity> tvList = data;
        for (var video in tvList) {
          if (video.site == 'YouTube' && video.type == 'Teaser' && video.key != null && video.key != '') {

            YoutubePlayerController controller = YoutubePlayerController(
              initialVideoId: video.key!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
              ),
            );

            return emit(TVPlayerLoaded(controller));

          }
        }

        emit(FailuerLoadTVPlayer('没有找到TV预览'));

      }
    );

  }

}
