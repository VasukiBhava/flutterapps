import 'package:flutter/material.dart';

import '../presentation/home_screen/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes =>
      {homeScreen: HomeScreen.builder, initialRoute: HomeScreen.builder};
}
