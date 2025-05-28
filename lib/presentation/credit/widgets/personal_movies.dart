import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/movie/movie_card.dart';

import '../../../domain/movie/entities/movie.dart';

class PersonalMovieWidget extends StatelessWidget {

  final List<MovieEntity> personalMovies;

  const PersonalMovieWidget({super.key, required this.personalMovies});

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      // 禁用滚动，防止与父级ScrollView冲突
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.54,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: personalMovies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: personalMovies[index]);
      },
    );


    // return ListView.separated(
    //   itemBuilder: (context, index) {
    //     return MovieCard(movie: personalMovies[index]);
    //   }, 
    //   separatorBuilder: (context, index) => SizedBox(width: 10,), 
    //   itemCount: personalMovies.length);
  }
}