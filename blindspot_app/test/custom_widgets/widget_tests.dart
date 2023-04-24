import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {

  group('AppRoutes', () {
    testWidgets('should display the Login for /landingscreen route',
        (WidgetTester tester) async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await tester.pumpWidget(GetMaterialApp(
        initialRoute: '/landingscreen',
        getPages: AppRoutes.routesList(),
      ));

      expect(find.byType(LandingScreen), findsOneWidget);
    });
  });
}
