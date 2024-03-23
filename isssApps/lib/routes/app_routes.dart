import 'package:flutter/material.dart';
import 'package:isssApps/presentation/artwork_screen/artwork_screen.dart';
import 'package:isssApps/presentation/splash_screen/splash_screen.dart';
import 'package:isssApps/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String artWorkScreen = '/artwork_screen';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        artWorkScreen: ArtWorkPage.builder,
        splashScreen: SplashScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
