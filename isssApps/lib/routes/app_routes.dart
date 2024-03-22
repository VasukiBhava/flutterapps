import 'package:flutter/material.dart';
import 'package:vasuki_s_application1/presentation/security_policy_screen/security_policy_screen.dart';
import 'package:vasuki_s_application1/presentation/splash_screen/splash_screen.dart';
import 'package:vasuki_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String securityPolicyScreen = '/security_policy_screen';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        securityPolicyScreen: SecurityPolicyScreen.builder,
        splashScreen: SplashScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
