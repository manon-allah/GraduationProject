
import 'package:image_picker/image_picker.dart';

selectImage(ImageSource source)async{
  final ImagePicker _imagePick = ImagePicker();
  XFile? _image = await _imagePick.pickImage(source: source);
  if(_image != null){
    return await _image.readAsBytes();
  }
  print("No image selected");
}