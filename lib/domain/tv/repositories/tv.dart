import 'package:dartz/dartz.dart';

import '../entities/tv.dart';

abstract class TVRepository {
  Future<Either<String, List<TVEntity>>> getTrendingTVs();
}