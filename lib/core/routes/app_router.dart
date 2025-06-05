import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/features/home/view/home_screen.dart';
import 'package:lilac_test/features/splash/view/splash_screen.dart';


class RouteGenerator {
  static const String initial = '/';
  static const String home = '/home';


static Route<dynamic> generateRoute(RouteSettings settings) {
    // Check for routes with path parameters
    // final uri = Uri.parse(settings.name ?? '');
    
   
    
    switch (settings.name) {
      case initial:
      
        return getPageRoute(SplashScreen());
      case home:
      
        return getPageRoute(HomeScreen());

      
      default:
        return
          MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute getPageRoute(Widget child, {String? routeName}) {
    return Theme.of(navKey.currentContext!).platform == TargetPlatform.iOS
        ? CupertinoPageRoute(
            builder: (_) => child, 
            settings: RouteSettings(name: routeName)
          )
        : MaterialPageRoute(
            builder: (_) => child,
            settings: RouteSettings(name: routeName)
          );
  }
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
