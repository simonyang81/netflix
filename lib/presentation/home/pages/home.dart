import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix/presentation/home/widgets/now_playing_movies.dart';

import '../../../common/widgets/text/category_text.dart';
import '../../../core/constants/app_vectors.dart';
import '../widgets/trending_movies.dart';
import '../widgets/trending_tv.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.search)),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(title: 'Trending Movies 🔥'),
              const SizedBox(height: 10),
              TrendingMoviePage(),
              const SizedBox(height: 20),
              CategoryText(title: 'Now Playing 🎬'),
              const SizedBox(height: 10),
              NowPlayingMovie(page: 1,),
              const SizedBox(height: 20),
              CategoryText(title: 'Trending TV Shows 🔥'),
              const SizedBox(height: 10),
              TrendingTVWidget(),
            ],
          ),
        ),
      ),
    );
  }
}