import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/common/widgets/text/category_text.dart';
import 'package:netflix/presentation/watch/widgets/movie_credits.dart';
import 'package:netflix/presentation/watch/widgets/movie_overview.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoPlayer(movieId: movie.id!),
            SizedBox(height: 10,),
            MovieOverview(overview: movie.overview ?? ''),
            SizedBox(height: 20,),
            MovieCredit(movieId: movie.id!),
          ],
        ),
      ),
    );
  }
}