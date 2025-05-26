import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_cubit.dart';
import '../../../domain/movie/entities/trending_movie.dart';
import '../../../domain/movie/usecases/get_trending_movies.dart';
import '../../../service_locator.dart';

class TrendingMoviePage extends StatelessWidget {
  const TrendingMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TrendingMovieEntity>, int?>(sl<GetTrendingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(builder: (context, state) {

        if (state is DataInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FailureLoadData) {
          return Center(child: Text(state.errorMessage));
        } else if (state is DataLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Text(state.data[index].title ?? '');
              },
            ),
          );
        }

        return const SizedBox.shrink();
        
      },)
    );
  }
}