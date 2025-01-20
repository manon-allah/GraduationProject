import 'dart:io';

abstract class StorageRepository {
  Future<String?> uploadProfileImage(String path , String fileName);
  Future<List<String>> uploadPostImages(List<File> paths , String fileName , String username , String name);

}
