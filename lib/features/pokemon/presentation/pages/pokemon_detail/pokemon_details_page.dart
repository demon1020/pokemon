import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/pokemon_detail/pokemon_details_page_skeleton.dart';

import '../../../../../core/common/res/styles.dart';
import '../../widgets/widgets.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/pokemon_bloc.dart';
import '../../bloc/pokemon_event.dart';
import '../../bloc/pokemon_state.dart';

class PokemonDetailPage extends StatefulWidget {
  final dynamic pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  Future<bool> _onBackPressed(BuildContext context) async {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemonBloc.add(FetchPokemonEvent());
    return true;
  }
  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    var locale = S.of(context);
    var item = widget.pokemon;
    return WillPopScope(
      onWillPop: (){
        return _onBackPressed(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state.isLoading) {
                return PokemonDetailPageSkeleton(loading: state.isLoading);
              } else if (state.hasError) {
                return const Center(child: Text('Failed to fetch Pokemons'));
              } else {
                item = state.pokemonList[0];
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            height: 200,
                            width: double.infinity,
                            imageUrl: item.imageUrl,
                            placeholder: (context, url) =>
                                const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.name,
                          style: AppStyle.titleTextStyleLarge(),
                        ),
                        const SizedBox(
                          width: 30,
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppWidget.buildEvenRow(
                            placeHolder: locale.height,
                            value:
                                "${item.height.split(" ").first.substring(0, 5)} ${item.height.split(" ").last}"),
                        AppWidget.buildEvenRow(
                            placeHolder: locale.weight,
                            value:
                                "${item.weight.split(" ").first.substring(0, 5)} ${item.weight.split(" ").last}"),
                        AppWidget.buildEvenRow(
                            placeHolder: locale.generation, value: item.generation),
                        AppWidget.buildEvenRow(
                            placeHolder: locale.baseExperience,
                            value: "${item.baseExperience}"),
                        const SizedBox(height: 5),
                        const Divider(),
                        const SizedBox(height: 5),
                        Text(
                          locale.type,
                          style: AppStyle.titleTextStyleMedium(),
                        ),
                        AppWidget.buildWrap(item.type),
                        const SizedBox(height: 10),
                        Text(
                          locale.abilities,
                          style: AppStyle.titleTextStyleMedium(),
                        ),
                        AppWidget.buildWrap(item.abilities),
                        const SizedBox(height: 10),
                        Text(
                          locale.stats,
                          style: AppStyle.titleTextStyleMedium(),
                        ),
                        AppWidget.buildWrapFromMap(item.stats),
                      ],
                    ),
                  ),
                ),
              );}
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Random random = Random();
            pokemonBloc.add(FetchPokemonByIdEvent(pokemonId: random.nextInt(100)));
          },
          child: const Icon(Icons.shuffle),
        ),
      ),
    );
  }

}

