import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getTrendingTVs();
  Future<Either> getTVVideo(int tvId);
  Future<Either> getTVSeriesDetail(int tvId);
  Future<Either> getTVCredits(int tvId);
}