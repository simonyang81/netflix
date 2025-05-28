import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_cubit.dart';
import '../../../common/widgets/tv/tv_card.dart';
import '../../../domain/tv/entities/tv.dart';
import '../../../domain/tv/usecases/get_trending_tv.dart';
import '../../../service_locator.dart';

class TrendingTVWidget extends StatelessWidget {
  const TrendingTVWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TVEntity>, int?>(sl<GetTrendingTVsUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is DataLoaded<List<TVEntity>>) {
            return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TVCard(tv: state.data[index]);
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