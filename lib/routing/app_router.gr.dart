// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/food.dart' as _i6;
import '../presentation/details/details_screen.dart' as _i3;
import '../presentation/home/home.dart' as _i2;
import '../presentation/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    DetailsScreen.name: (routeData) {
      final args = routeData.argsAs<DetailsScreenArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailsScreen(
          key: args.key,
          food: args.food,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HomeScreen.name,
          path: '/home-screen',
        ),
        _i4.RouteConfig(
          DetailsScreen.name,
          path: '/details-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.DetailsScreen]
class DetailsScreen extends _i4.PageRouteInfo<DetailsScreenArgs> {
  DetailsScreen({
    _i5.Key? key,
    required _i6.Food food,
  }) : super(
          DetailsScreen.name,
          path: '/details-screen',
          args: DetailsScreenArgs(
            key: key,
            food: food,
          ),
        );

  static const String name = 'DetailsScreen';
}

class DetailsScreenArgs {
  const DetailsScreenArgs({
    this.key,
    required this.food,
  });

  final _i5.Key? key;

  final _i6.Food food;

  @override
  String toString() {
    return 'DetailsScreenArgs{key: $key, food: $food}';
  }
}
