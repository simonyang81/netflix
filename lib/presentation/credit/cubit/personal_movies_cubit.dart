import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/movie/entities/movie.dart';
import '../../../domain/person/entities/person.dart';
import '../../../domain/person/usecases/get_person.dart';
import '../../../domain/person/usecases/get_personal_movies.dart';
import '../../../service_locator.dart';

part 'personal_movies_state.dart';

class PersonalMoviesCubit extends Cubit<PersonalMoviesState> {
  PersonalMoviesCubit() : super(PersonalMoviesInitial());

  void getPersonalMovies(int personId) async {
    emit(PersonalMoviesInitial());
    
    // 同时启动两个请求，实现并行执行
    final personalFuture = sl<GetPersonUseCase>().call(params: personId);
    final personalMoviesFuture = sl<GetPersonalMoviesUseCase>().call(params: personId);
    
    // 等待两个请求都完成
    final personalResult = await personalFuture;
    final personalMoviesResult = await personalMoviesFuture;

    // 处理个人信息和个人电影数据的结果
    if (personalResult.isLeft() && personalMoviesResult.isLeft()) {
      // 只有两个请求都失败时，才发出错误状态
      final errorMessage = personalResult.fold((error) => error, (data) => '');
      emit(FailureLoadPersonalMovies(errorMessage));
    } else {
      // 至少有一个请求成功，发出加载完成状态（失败的请求对应数据为null）
      final person = personalResult.fold((error) => null, (data) => data as PersonEntity);
      final personalMovies = personalMoviesResult.fold((error) => null, (data) => data as List<MovieEntity>);
      emit(PersonalMoviesLoaded(person, personalMovies));
    }
  }


  
}
