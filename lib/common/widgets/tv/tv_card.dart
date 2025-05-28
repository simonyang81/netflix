import 'package:flutter/material.dart';
import 'package:netflix/presentation/watch/pages/watch_tv.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../domain/tv/entities/tv.dart';
import '../../helper/navigation/app_navigation.dart';
import '../images/cached_image.dart';

class TVCard extends StatelessWidget {

  final TVEntity tv;

  const TVCard({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, WatchTVPage(tv: tv));
      },
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: CachedImage(
                imageUrl: '${AppImages.movieImageBasePath}${tv.posterPath}',
                width: double.infinity,
                fit: BoxFit.fill,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tv.name ?? '',
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
                      ' ${tv.voteAverage!.toStringAsFixed(1)}',
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