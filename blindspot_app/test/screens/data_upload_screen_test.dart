import 'package:blindspot_app/firestore_references/collection_refs.dart';
import 'package:blindspot_app/screens/data_upload_screen.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('DataUploadScreen', () {
    testWidgets('should show "Uploading Complete" when loadStatus is complete',
        (WidgetTester tester) async {
      final controller = DatabaseUploadService();
      controller.loadStatus.value = LoadStatus.complete;

      await tester.pumpWidget(GetMaterialApp(home: DataUploadScreen()));

      expect(find.text('Uploading Complete'), findsOneWidget);
    });
  });
}
