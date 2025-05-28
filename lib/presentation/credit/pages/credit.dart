import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../domain/person/entities/person.dart';
import '../../../domain/person/usecases/get_person.dart';
import '../../../service_locator.dart';
import '../widgets/credit_infotmation.dart';

class CreditPage extends StatelessWidget {

  final int personId;

  const CreditPage({super.key, required this.personId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        // title: Text(credit.name ?? ''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocProvider(
              create: (context) => GenericDataCubit()..getData<PersonEntity, int>(sl<GetPersonUseCase>(), params: personId),
              child: BlocBuilder<GenericDataCubit, GenericDataState>(
                builder: (context, state) {

                  if (state is DataInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FailureLoadData) {
                    return Center(child: Text(state.errorMessage));
                  }

                  if (state is DataLoaded<PersonEntity>) {
                    return Column(
                      children: [
                        CreditInformation(person: state.data),
                      ],
                    );
                  }

                  return SizedBox();
                  
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}