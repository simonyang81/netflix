import 'package:dartz/dartz.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetTVVideoUseCase extends UseCase<Either, int> {
  
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getTVVideo(params!);
  }
  
}