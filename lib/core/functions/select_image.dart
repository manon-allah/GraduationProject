import 'package:image_picker/image_picker.dart';

Future<List<String>> selectImage() async {
  final ImagePicker imagePick = ImagePicker();
  List<XFile>? images = await imagePick.pickMultiImage();

  return images.map((image) => image.path).toList();
}
