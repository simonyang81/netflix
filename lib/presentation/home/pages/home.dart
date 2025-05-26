import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widgets/text/category_text.dart';
import '../../../core/constants/app_vectors.dart';
import 'trending_movies.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            const SizedBox(height: 10),
            TrendingMoviePage(),

          ],
        ),
      ),
    );
  }
}