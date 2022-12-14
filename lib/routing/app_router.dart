import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/presentation/details/details_screen.dart';
import 'package:food_shop/presentation/home/home.dart';
import 'package:food_shop/presentation/splash_screen/splash_screen.dart';

Route<T> fadePageBuilder<T>(
    BuildContext context, Widget child, CustomPage page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    reverseTransitionDuration: const Duration(milliseconds: 900),
    settings: page,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, anim1, __, child) => FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
      child: child,
    ),
  );
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: HomeScreen,
    ),
    AutoRoute(
      page: DetailsScreen,
    ),
  ],
)
class $AppRouter {}
