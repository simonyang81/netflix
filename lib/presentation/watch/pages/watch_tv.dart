import 'package:flutter/material.dart';
import 'package:netflix/presentation/watch/widgets/tv_credits.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../domain/tv/entities/tv.dart';
import '../widgets/tv_series_overview.dart';
import '../widgets/tv_video_player.dart';

class WatchTVPage extends StatelessWidget {

  final TVEntity tv;

  const WatchTVPage({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
            
                TVVideoPlayer(tvId: tv.id!),
                SizedBox(height: 20,),
                TVSeriesOverview(tvId: tv.id!,),
                const SizedBox(height: 20,),
                TVCredits(tvId: tv.id!),

            
              ],
            ),
          ),
        ),
      ),
    );
  }
}