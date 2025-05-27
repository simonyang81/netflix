import '../../../data/movie/models/video.dart';
import '../../../domain/movie/entities/video.dart';

class VideoMapper {

  static VideoEntity toEntity(VideoModel model) {
    return VideoEntity(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }


}