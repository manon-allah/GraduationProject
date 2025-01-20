import 'package:instagram/features/stories/domain/entities/story_entity.dart';

abstract class StoryRepository {
  Future<List<StoryEntity>> getAllStories();
  Future<void> addStory(StoryEntity story);
  Future<void> deleteStory(String storyId);
  Future<List<StoryEntity>> getStoriesByUserId(String userId);
}