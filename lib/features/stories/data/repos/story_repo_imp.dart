import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/features/stories/domain/entities/story_entity.dart';
import '../../domain/repos/story_repo.dart';

class StoryRepositoryImp implements StoryRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference storyCollection =
      FirebaseFirestore.instance.collection('stories');

  @override
  Future<void> addStory(StoryEntity story) async {
    try {
      await storyCollection.doc(story.id).set(story.toMap());
    } catch (e) {
      throw Exception('Error adding post: $e');
    }
  }

  @override
  Future<void> deleteStory(String storyId) async {
    await storyCollection.doc(storyId).delete();
  }

  @override
  Future<List<StoryEntity>> getAllStories() async {
    try {
      final storySnapshot = await storyCollection
          .where(
            'datePublished',
            isGreaterThan: DateTime.now().subtract(
              const Duration(
                hours: 24,
              ),
            ),
          )
          .get();
      var allStories = storySnapshot.docs.map((doc) {
        return StoryEntity.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return allStories;
    } catch (e) {
      log(e.toString());
      throw Exception('Error getting story: $e');
    }
  }

  @override
  Future<List<StoryEntity>> getStoriesByUserId(String userId) async {
    try {
      final storySnapshot =
          await storyCollection.where('userId', isEqualTo: userId).get();

      final userStory = storySnapshot.docs
          .map((doc) => StoryEntity.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return userStory;
    } catch (e) {
      throw Exception('Error getting post by user : $e');
    }
  }
}
