import 'package:get/get.dart' show GetPage;
import 'route_name.dart';
import '../binding/binding.dart';
import '../ui/page/page.dart';

class RouteCollection {
  static final routeCollection = [
    GetPage(
        name: RouteName.rootRoute,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: RouteName.mainTabRoute,
        page: () => const MainTabPage(),
        binding: MainTabBinding()),
    GetPage(
        name: RouteName.themeModeRoute,
        page: () => const ThemeModePage(),
        binding: SettingsBinding()),
    GetPage(
        name: RouteName.languageRoute,
        page: () => const LanguagePage(),
        binding: SettingsBinding()),
    GetPage(
        name: RouteName.loginRoute,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.signUpRoute,
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
    GetPage(name: RouteName.bookingRoute, page: () => const BookingPage()),
    GetPage(name: RouteName.helpFaqRoute, page: () => const HelpFaqPage()),
    GetPage(
        name: RouteName.notificationRoute,
        page: () => const NotificationsPage()),
    GetPage(name: RouteName.profileRoute, page: () => ProfilePage()),
    GetPage(
        name: RouteName.myServiceRoute,
        page: () => const MyServicePage(),
        binding: MyServiceBinding()),
    GetPage(
        name: RouteName.myServiceDetailRoute,
        page: () => const MyServiceDetailPage()),
    GetPage(name: RouteName.searchRoute, page: () => const SearchPage()),
    GetPage(name: RouteName.chatTypeViewRoute, page: () => ChatTypeView()),
  ];
}
