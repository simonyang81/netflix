import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/assets/app_images.dart';

import '../../../domain/movie/entities/movie.dart';
import '../../../presentation/watch/pages/watch_movie.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, WatchMoviePage(movie: movie));
      },
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      '${AppImages.movieImageBasePath}${movie.posterPath}',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(
                      ' ${movie.voteAverage!.toStringAsFixed(1)}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
