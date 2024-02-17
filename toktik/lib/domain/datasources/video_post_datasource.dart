import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostDataSource {
  Future<List<VideoPost>> getFavouriteVideosByUser(String userId);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
