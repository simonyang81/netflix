import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../cubit/personal_movies_cubit.dart';
import '../widgets/credit_infotmation.dart';
import '../widgets/personal_movies.dart';

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
        child: BlocProvider(create: (context) => PersonalMoviesCubit()..getPersonalMovies(personId),
          child: BlocBuilder<PersonalMoviesCubit, PersonalMoviesState>(
            builder: (context, state) {
              if (state is PersonalMoviesInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FailureLoadPersonalMovies) {
                return Center(child: Text(state.errorMessage));
              }

              if (state is PersonalMoviesLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.person != null ? CreditInformation(person: state.person!) : const SizedBox(),
                        SizedBox(height: 20),
                        Text('相关作品', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 10),
                        PersonalMovieWidget(personalMovies: state.personalMovies ?? []),
                  
                      ],
                    ),
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
        // child: SingleChildScrollView(
          // child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     child: BlocProvider(
        //       create: (context) => GenericDataCubit()..getData<PersonEntity, int>(sl<GetPersonUseCase>(), params: personId),
        //       child: BlocBuilder<GenericDataCubit, GenericDataState>(
        //         builder: (context, state) {

        //           if (state is DataInitial) {
        //             return const Center(child: CircularProgressIndicator());
        //           }

        //           if (state is FailureLoadData) {
        //             return Center(child: Text(state.errorMessage));
        //           }

        //           if (state is DataLoaded<PersonEntity>) {
        //             return Column(
        //               children: [
        //                 CreditInformation(person: state.data),
        //               ],
        //             );
        //           }

        //           return SizedBox();
                  
        //         },
        //       ),
        //     ),
        //   ),
        // ),
    );
  }
}