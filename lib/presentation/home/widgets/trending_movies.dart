import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_cubit.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../domain/movie/entities/movie.dart';
import '../../../domain/movie/usecases/get_trending_movies.dart';
import '../../../service_locator.dart';

class TrendingMoviePage extends StatelessWidget {
  const TrendingMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>, int?>(sl<GetTrendingMoviesUseCase>(),),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          } else if (state is DataLoaded<List<MovieEntity>>) {

            final movies = state.data;
            //  as List<TrendingMovieEntity>?;
            if (movies.isEmpty) {
              return const Center(child: Text('暂无数据'));
            }

            return FanCarouselImageSlider.sliderType1(
              imagesLink: movies
                  .where((item) => item.posterPath != null) // 过滤空值
                  .map((item) => '${AppImages.movieImageBasePath}${item.posterPath}',)
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 300,
              showIndicator: true,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
