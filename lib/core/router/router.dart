import 'package:go_router/go_router.dart';
import 'package:pixel_field/features/settings/pages/settings_page.dart';
import 'package:pixel_field/features/sign_in/pages/sign_in_page.dart';
import 'package:pixel_field/features/welcome/pages/welcome_page.dart';
import '../../features/collection/pages/collection_page.dart';
import '../../features/collection_details/pages/collection_details_page.dart';
import '../../features/scan/pages/scan_page.dart';
import '../../features/shop/pages/shop_page.dart';
import 'main_navigation.dart';

class AppRouter {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: WelcomePage.path,
    routes: [
      GoRoute(
        path: MainNavigationPage.path,
        name: MainNavigationPage.name,
        builder: (context, state) => const MainNavigationPage(),
      ),
      GoRoute(
        path: WelcomePage.path,
        name: WelcomePage.name,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: SignInPage.path,
        name: SignInPage.name,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: CollectionPage.path,
        name: CollectionPage.name,
        builder: (context, state) => const CollectionPage(),
      ),
      GoRoute(
        path: CollectionDetailsPage.path,
        name: CollectionDetailsPage.name,
        builder: (context, state) => CollectionDetailsPage(),
      ),
      GoRoute(
        path: ScanPage.path,
        name: ScanPage.name,
        builder: (context, state) => ScanPage(),
      ),
      GoRoute(
        path: ShopPage.path,
        name: ShopPage.name,
        builder: (context, state) => ShopPage(),
      ),
      GoRoute(
        path: SettingsPage.path,
        name: SettingsPage.name,
        builder: (context, state) => SettingsPage(),
      ),
    ],
  );
}
