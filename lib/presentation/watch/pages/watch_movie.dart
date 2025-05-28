import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/presentation/watch/widgets/movie_credits.dart';
import 'package:netflix/presentation/watch/widgets/movie_overview.dart';
import 'package:netflix/presentation/watch/widgets/release_day.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';

import '../../../domain/movie/entities/movie.dart';

class WatchMoviePage extends StatelessWidget {

  final MovieEntity movie;

  const WatchMoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(movie.title ?? '', style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                VideoPlayer(movieId: movie.id!),
                const SizedBox(height: 10,),
                ReleaseDay(movie: movie),
                const SizedBox(height: 10),
                MovieOverview(overview: movie.overview ?? ''),
                const SizedBox(height: 20,),
                MovieCredit(movieId: movie.id!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}