import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../../domain/repos/storage_repo.dart';

class StorageRepositoryImp implements StorageRepository {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String?> uploadProfileImage(String path, String fileName) {
    return uploadFile(path, fileName, 'profileImages');
  }

  Future<String?> uploadFile(
    String path,
    String fileName,
    String folder,
  ) async {
    try {
      final file = File(path);

      final storageRef = firebaseStorage.ref().child('$folder/$fileName');

      final uploadTask = await storageRef.putFile(file);

      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  Future<List<String>> uploadImages(
    List<File> paths,
    String userId,
    String username,
    String name,
  ) async {
    try {
      List<String> imageUrls = [];

      final storageRef = FirebaseStorage.instance.ref();

      for (var image in paths) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';
        final ref = storageRef.child('$username/$userId/$name/$fileName');
        await ref.putFile(image);
        final downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
      return imageUrls;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  @override
  Future<List<String>> uploadPostImages(
    List<File> paths,
    String userId,
    String username,
    String name,
  ) async {
    return uploadImages(
      paths,
      userId,
      username,
      name,
    );
  }

  @override
  Future<List<String>> uploadStoriesImages(
    List<File> paths,
    String userId,
    String username,
    String name,
  ) {
    return uploadImages(
      paths,
      userId,
      username,
      name,
    );
  }
}
