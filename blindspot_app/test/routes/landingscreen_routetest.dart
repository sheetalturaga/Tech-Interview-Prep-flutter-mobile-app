import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Checks if the landing screen route exists, has the correct page, has a binding
// for the authorization controller
void main() {
  
  group('AppRoutes', () {
    test('should have the correct /loginscreen route', () {
      final routes = AppRoutes.routesList();

      final loginPageRoute =
          routes.firstWhere((route) => route.name == '/loginscreen');

      expect(loginPageRoute, isNotNull);
      expect(loginPageRoute.page, isA<Function>());
      expect(loginPageRoute.page(), isA<LandingScreen>());
      expect(loginPageRoute.binding, isA<BindingsBuilder>());
      expect(find.byType(SignInButton), findsOneWidget);
      expect(find.text('Sign in with Google'), findsOneWidget);
    });
  });

  group('AppRoutes', () {
    testWidgets('should display the LandingScreen for /landingscreen route',
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
