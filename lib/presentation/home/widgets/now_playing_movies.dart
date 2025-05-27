import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';

import '../../../common/widgets/movie/movie_card.dart';
import '../../../domain/movie/entities/movie.dart';
import '../../../domain/movie/usecases/get_now_playing_movies.dart';
import '../../../service_locator.dart';

class NowPlayingMovie extends StatelessWidget {

  final int page;

  const NowPlayingMovie({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>, int?>(sl<GetNowPlayingMoviesUseCase>(), params: page),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is DataLoaded<List<MovieEntity>>) {
            return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: state.data[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: state.data.length
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),

    );
  }
}