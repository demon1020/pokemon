import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonHomePageSkeleton extends StatelessWidget {
  final bool loading;
  const PokemonHomePageSkeleton({
    super.key,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      child: StaggeredGrid.count(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(20, (index) {
          return Container(
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
                    imageUrl: "item.imageUrl",
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
                  child: const Text(
                    "item.name",
                    style: TextStyle(
                      fontFamily: 'Pokemon-solid',
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
