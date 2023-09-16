import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livine/src/constants/constants.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../data/favorites.dart';
import '../../../loading/loading.dart';

class Favorites extends ConsumerStatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  ConsumerState<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends ConsumerState<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(getFavoritesProvider(context: context));
    final word = TranslationRepo.translate(context);
    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(const Duration(seconds: 2))
            .then((_) => ref.refresh(getFavoritesProvider(context: context)));
      },
      backgroundColor: colorScheme(context).surface,
      child: Scaffold(
        appBar: AppBar(
          title: Text(word?.favorites ?? ""),
        ),
        body: favorites.when(
            data: (data) => RawScrollbar(
                  thumbColor: colorScheme(context).tertiary,
                  thickness: 5,
                  radius: const Radius.circular(10),
                  child: ListView.builder(
                    itemCount: data.id.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 200,
                        height: 150,
                        child: Dismissible(
                          key: Key(data.name[index]),
                          onDismissed: (_) {
                            deleteFavorite(
                                    ref: ref,
                                    recipeID: data.id[index],
                                    mounted: mounted,
                                    context: context)
                                .then((value) => ref.refresh(
                                    getFavoritesProvider(context: context)));
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Center(
                                child: Text(
                              "Delete",
                              style:
                                  TextStyle(fontFamily: 'Kine', fontSize: 22.0),
                            )),
                          ),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: restAPIMedia + data.imageURL[index],
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  data.name[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'Kine', fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            error: (Object error, StackTrace? stackTrace) {
              log("$error \t $stackTrace");
              return const Text("An Error Occured");
            },
            loading: () => const Loading()),
      ),
    );
  }
}
