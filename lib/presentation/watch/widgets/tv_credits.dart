import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_cubit.dart';
import '../../../common/widgets/credit/credit_card.dart';
import '../../../domain/person/entities/credit.dart';
import '../../../domain/tv/usecases/get_tv_credits.dart';
import '../../../service_locator.dart';

class TVCredits extends StatelessWidget {
  final int tvId;

  const TVCredits({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<CreditEntity>, int>(
          sl<GetTVCreditslUseCase>(),
          params: tvId,
        ),

      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is DataLoaded<List<CreditEntity>>) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '演员和工作人员',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CreditCard(credit: state.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
