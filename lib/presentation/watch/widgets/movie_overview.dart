import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {

  final String overview;

  const MovieOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              '影片简介',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 10, ),
              Text(
                overview,
                style: Theme.of(context).primaryTextTheme.bodyMedium
              )
        ],
      ),
    );

  }
}