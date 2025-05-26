part of 'generic_data_cubit.dart';

@immutable
sealed class GenericDataState {}

final class DataInitial extends GenericDataState {}

final class DataLoaded<T> extends GenericDataState {
  final T data;
  DataLoaded({required this.data});
}

class FailureLoadData extends GenericDataState {
  final String errorMessage;
  FailureLoadData({required this.errorMessage});
}
