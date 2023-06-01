import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/bottom_navigation/di/bottom_navigation_factory.dart';
import '../features/home/di/home_factory.dart';
import '../features/movie_details/di/details_factory.dart';
import '../features/search/di/search_factory.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: <RouteBase>[
      // bottom navigation com uma navegacao aninhada (nested)
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return BottomNavigationFactory.bottomNavigation(navigationShell);
        },
        branches: <StatefulShellBranch>[
          // primeira tab
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _sectionANavigatorKey,
                name: '/home',
                path: '/home',
                builder: (BuildContext context, GoRouterState state) => HomeFactory.home(),
                routes: <RouteBase>[
                  // tela de detalhes da primeira tab
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: '/details',
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      final id = state.extra as int;
                      return MovieDetailsFactory.details(id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: '/search',
                path: '/search',
                builder: (BuildContext context, GoRouterState state) => SearchFactory.search(),
                routes: <RouteBase>[],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
