part of 'story_cubit.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoryUploading extends StoryState {}

final class StorySuccess extends StoryState {
  final List<StoryEntity> stories;
  StorySuccess(this.stories);
}

final class StoryError extends StoryState {
  final String message;
  StoryError(this.message);
}
