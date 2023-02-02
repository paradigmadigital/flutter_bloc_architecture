import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_architecture/presentation/pages/cards/cards_page.dart';
import 'package:flutter_bloc_architecture/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.route,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: CardsPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const CardsPage();
          },
        ),
      ],
    ),
  ],
);
