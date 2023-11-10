import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/common/res/styles.dart';
import '../../widgets/widgets.dart';

class PokemonDetailPageSkeleton extends StatelessWidget {
  final bool loading;

  const PokemonDetailPageSkeleton({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Skeletonizer(
          enabled: loading,
          child: Container(
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
                        imageUrl: "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.shadowsphotography.co%2Fdiscover-photography-the-art-of-the-image%2F&psig=AOvVaw11FxS9InNGdiXrowmMWhjW&ust=1699699011163000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDnkdieuYIDFQAAAAAdAAAAABAI",
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "item.name",
                      style: AppStyle.titleTextStyleLarge(),
                    ),
                    const SizedBox(
                      width: 30,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppWidget.buildEvenRow(placeHolder: "place holder", value: "value"),
                    AppWidget.buildEvenRow(placeHolder: "place holder", value: "value"),
                    AppWidget.buildEvenRow(placeHolder: "place holder", value: "value"),
                    AppWidget.buildEvenRow(placeHolder: "place holder", value: "value"),

                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    Text(
                      "locale.type",
                      style: AppStyle.titleTextStyleMedium(),
                    ),
                    AppWidget.buildWrap(["","",""]),
                    const SizedBox(height: 10),
                    Text(
                      "locale.abilities",
                      style: AppStyle.titleTextStyleMedium(),
                    ),
                    AppWidget.buildWrap(["","",""]),
                    const SizedBox(height: 10),
                    Text(
                      "locale.stats",
                      style: AppStyle.titleTextStyleMedium(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

