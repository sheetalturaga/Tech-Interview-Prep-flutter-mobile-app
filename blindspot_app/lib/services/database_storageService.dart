import 'package:get/get.dart';
import '../firestore_references/collection_refs.dart';

// Set up to download images from the storage
class DatabaseStorageService extends GetxService {
  Future<String?> getImage(String? imageName) async {
    if (imageName == null) {
      return null;
    }
    try {
      var storageRef =
          storage.child("topic_images").child('${imageName.toLowerCase()}.png');
      var imageRef = await storageRef.getDownloadURL();

      return imageRef;
    } catch (e) {
      return null;
    }
  }
}
