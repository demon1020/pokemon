import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/common/services/router/route_names.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/home/pokemon_home_page.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/pokemon_detail/pokemon_details_page.dart';
import 'package:go_router/go_router.dart';

import '../../views/error_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) => ErrorView(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            name: AppRoute.pokemonDetailPage,
            path: AppRoute.pokemonDetailPage,
            builder: (BuildContext context, GoRouterState state) =>
                PokemonDetailPage(pokemon: state.extra),
          ),
        ],
        path: AppRoute.homePage,
        builder: (BuildContext context, GoRouterState state) =>
            const PokemonHomePage(),
      ),
    ],
  );
}
