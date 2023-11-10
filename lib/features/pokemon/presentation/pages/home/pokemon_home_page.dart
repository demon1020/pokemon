import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/core/common/services/router/route_names.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/home/pokemon_home_page_skeleton.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/l10n.dart';
import '../../bloc/pokemon_bloc.dart';
import '../../bloc/pokemon_event.dart';
import '../../bloc/pokemon_state.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  bool isGridview = true;

  @override
  void initState() {
    super.initState();
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemonBloc.add(FetchPokemonEvent());
  }

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    var locale = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.appName,
          style: const TextStyle(
            fontFamily: 'Pokemon-solid',
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                isGridview = !isGridview;
                setState(() {});
              },
              icon: Icon(isGridview ? Icons.list : Icons.grid_view_rounded),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pokemonBloc.add(FetchPokemonEvent());
        },
        child: const Icon(Icons.refresh),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state.isLoading) {
                return PokemonHomePageSkeleton(loading: state.isLoading);
              } else if (state.hasError) {
                return const Center(child: Text('Failed to fetch pokemons'));
              } else {
                return StaggeredGrid.count(
                  crossAxisCount: isGridview ? 2 : 1,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: List.generate(state.pokemonList.length, (index) {
                    var item = state.pokemonList[index];
                    return InkWell(
                      onTap: () {
                        context.goNamed(AppRoute.pokemonDetailPage,
                            extra: item);
                      },
                      child: Container(
                        height: 300,
                        // alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.primaries[index % 10].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index % 10]
                                    .withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 250,
                                width: double.infinity,
                                imageUrl: item.imageUrl,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index % 10]
                                    .withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontFamily: 'Pokemon-solid',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
