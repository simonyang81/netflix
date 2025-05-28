import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';
import 'package:netflix/domain/tv/entities/tv_series.dart';
import 'package:netflix/service_locator.dart';

import '../../../domain/tv/usecases/get_tv_series_detail.dart';

class TVSeriesOverview extends StatelessWidget {
  final int tvId;

  const TVSeriesOverview({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<TVSeriesEntity, int>(
          sl<GetTVSeriesDetailUseCase>(),
          params: tvId,
        ),

      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is DataLoaded<TVSeriesEntity>) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.data.name ?? '未知',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),

                /// 显示电影评分的组件
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '首播日期：${state.data.firstAirDate != null ? '${state.data.firstAirDate!.year}-${state.data.firstAirDate!.month.toString().padLeft(2, '0')}-${state.data.firstAirDate!.day.toString().padLeft(2, '0')}' : '未知'}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          state.data.voteAverage?.toStringAsFixed(1) ?? '暂无',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '简介',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  state.data.overview ?? '',
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
