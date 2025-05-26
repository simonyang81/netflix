import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/usecase/usecase.dart';

part 'generic_data_state.dart';

class GenericDataCubit extends Cubit<GenericDataState> {

  GenericDataCubit() : super(DataInitial());

  void getData<Type, Params>(UseCase usecase, {Params? params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error){
        emit(
          FailureLoadData(errorMessage: error)
        );
      },
      (data){
        emit(
          DataLoaded<Type>(data: data)
        );
      }
    );
  }

}
