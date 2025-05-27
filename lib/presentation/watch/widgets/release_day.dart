import 'package:flutter/material.dart';
import 'package:netflix/domain/movie/entities/movie.dart';

class ReleaseDay extends StatelessWidget {

  final MovieEntity movie;

  const ReleaseDay({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              '发布日期：${movie.releaseDate != null ? '${movie.releaseDate!.year}-${movie.releaseDate!.month.toString().padLeft(2, '0')}-${movie.releaseDate!.day.toString().padLeft(2, '0')}' : '未知'}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        /// 显示电影评分的组件
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
            const SizedBox(width: 4),
            Text(
              movie.voteAverage?.toStringAsFixed(1) ?? '暂无',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.amber,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}