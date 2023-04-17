import 'package:test/test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:blindspot_app/services/database_storageService.dart';

class MockStorageReference extends Mock implements Reference {}

class MockUploadTask extends Mock implements UploadTask {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockStorageTaskSnapshot extends Mock implements TaskSnapshot {}

class MockDatabaseStorageService extends DatabaseStorageService {
  final MockStorageReference mockStorageReference;
  final MockStorageTaskSnapshot mockStorageTaskSnapshot;

  MockDatabaseStorageService({
    required this.mockStorageReference,
    required this.mockStorageTaskSnapshot,
  });
  @override
  Future<String?> getImage(String? imageName) async {
    return 'http://test-image-url.com';
  }
}

void main() {
  late DatabaseStorageService databaseStorageService;
  late MockFirebaseStorage mockFirebaseStorage;
  late MockStorageReference mockStorageRef;
  late MockUploadTask mockUploadTask;
  late DatabaseStorageService service;

  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockStorageRef = MockStorageReference();
    mockUploadTask = MockUploadTask();
    databaseStorageService = DatabaseStorageService();
    service = MockDatabaseStorageService(
      mockStorageReference: MockStorageReference(),
      mockStorageTaskSnapshot: MockStorageTaskSnapshot(),
    );
    Get.put<FirebaseStorage>(mockFirebaseStorage);
  });

  group('getImage', () {
    //works
    test('returns null when imageName is null', () async {
      // Arrange
      final imageName = 'http://test-image-url.com';

      // Act
      final result = await databaseStorageService.getImage(imageName);

      // Assert
      expect(result, isNull);
    });

    test('getImage returns null when the image is not found', () async {
      final result =
          await databaseStorageService.getImage('non_existing_image');
      expect(result, isNull);
    });

    tearDown(() {
      Get.delete<DatabaseStorageService>();
    });
    test('getImage returns the download URL of the image', () async {
      final imageUrl = await service.getImage('test_image');
      expect(imageUrl, equals('http://test-image-url.com'));
    });
  });
}
