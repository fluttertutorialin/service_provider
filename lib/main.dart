import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'navigation/route_collection.dart';
import 'navigation/route_name.dart';
import 'service/settings_service.dart';
import 'service/translation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => GetStorage.init());

  // CALLING SERVICE
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => SettingsService().init());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: RouteName.rootRoute, //FIRST PAGE LAUNCHED
        getPages: RouteCollection.routeCollection, //COLLECTION ROUTE

        //defaultTransition: Transition.fade,
        enableLog: true,
        navigatorKey: navigatorKey,

        //LOCALIZATIONS
        locale: GetStorage().read('language') == null
            ? Get.deviceLocale
            : Locale(GetStorage().read('language')),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: Get.find<TranslationService>().supportedLocales(),
        translationsKeys: Get.find<TranslationService>().translations,
        fallbackLocale: Get.find<TranslationService>().fallbackLocale,
        defaultTransition: Transition.cupertino,
        debugShowCheckedModeBanner: false,

        //THEME
        themeMode: Get.find<SettingsService>().getThemeMode(),
        theme: Get.find<SettingsService>().getLightTheme(),
        darkTheme: Get.find<SettingsService>().getDarkTheme());
  }
}
