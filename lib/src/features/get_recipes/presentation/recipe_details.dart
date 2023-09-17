// ignore_for_file: type_annotate_public_apis

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/src/common_widgets/auth/auth_widget.dart';
import 'package:livine/src/features/get_recipes/presentation/share_screenshot.dart';
import 'package:livine/src/shared/cache/cache_helper.dart';

import '../../../translations/domain/translation_provider.dart';
import '../../auth/favorites/data/favorites.dart';
import '../../loading/loading.dart';
import '../../../constants/constants.dart';
import '../data/recipes.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class RecipeDetails extends StatefulHookWidget {
  const RecipeDetails({Key? key, required this.id}) : super(key: key);

  final dynamic id;

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  int index = 0;
  bool isFavorited = CacheHelper.getBool("isFavorited") ?? false;
  bool backDrop = false;

  // shareRecipe(String imageURL) async {
  //   final url = Uri.parse(imageURL);
  //   final response = await client.get(url);
  //   final temp = await getTemporaryDirectory();
  //   final path = '${temp.path}/image.jpg';

  //   File(path).writeAsBytesSync(response.bodyBytes);

  //   await Share.shareFiles([path], text: 'Great picture');
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final recipesData =
          ref.watch(recipesDetailsProvider(id: widget.id, context: context));
      final word = TranslationRepo.translate(context);

      return recipesData.when(
        data: (data) {
          return Scaffold(
              body: SlidingUpPanel(
            backdropEnabled: true,
            minHeight: MediaQuery.of(context).size.height * 0.6,
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        restAPIMedia + data.imageURL,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          radius: 25,
                          child: IconButton(
                              onPressed: () => context.pop(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).colorScheme.onSurface,
                              )),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              radius: 25,
                              child: IconButton(
                                  onPressed: () =>
                                      context.push('/share_recipe', extra: {
                                        "image": restAPIMedia + data.imageURL,
                                        "name": data.name,
                                        "calories": data.calories,
                                        "time": data.time_taken,
                                        "difficulty": data.difficulty
                                      }),
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )),
                            ),
                            const SizedBox(width: 10.0),
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              radius: 25,
                              child: IconButton(
                                  onPressed: () => addFavorite(
                                      ref: ref,
                                      recipeID: data.id,
                                      mounted: mounted,
                                      context: context),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isDraggable: true,
            panelBuilder: () => Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 4,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(data.name,
                        style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kine')),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RecipeTag(text: "${data.calories} ${word!.calories}"),
                        const SizedBox(width: 10.0),
                        RecipeTag(text: "${data.difficulty}"),
                        const SizedBox(width: 10.0),
                        RecipeTag(text: "${data.time_taken} ${word.minute}"),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Ingridents:",
                        //   style: TextStyle(fontSize: 22.0),
                        // ),
                        // Container(
                        //   height: 100,
                        //   child: ListView.separated(
                        //       separatorBuilder: (context, index) => SizedBox(
                        //             width: 10.0,
                        //           ),
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: 10,
                        //       itemBuilder: (context, index) {
                        //         return CircleAvatar(
                        //           radius: 30,
                        //           backgroundImage: CachedNetworkImageProvider(
                        //               restAPIMedia + data.imageURL),
                        //         );
                        //       }),
                        // ),
                      ],
                    ),
                    Text(
                      word.ingridents + ' :',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Container(
                      child: ListView.separated(
                          itemCount: data.ingridents.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.0,
                              ),
                          itemBuilder: (context, index) {
                            return Directions(
                                count: index + 1, text: data.ingridents[index]);
                          }),
                    ),
                    const SizedBox(height: 10.0),
                    CustomButton(
                        icon: SvgPicture.asset(
                            "assets/images/icons/chief_hat.svg",
                            width: 24,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                BlendMode.srcIn)),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        textColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        onPressed: () => context.push('/cooking', extra: {
                              "directions": data.directions,
                              "video": data.video
                            }),
                        isLoading: false,
                        text: word.start_cooking,
                        context: context),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ));
        },
        error: (Object error, StackTrace? stackTrace) {
          log("$error \t $stackTrace");
          return const Text("An Error Occured");
        },
        loading: () => const Loading(),
      );
    });
  }
}

class Directions extends StatelessWidget {
  const Directions({
    Key? key,
    required this.count,
    required this.text,
  }) : super(key: key);
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Container(
          height: 30.0,
          width: 3.0,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(20.0)),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w100),
          ),
        ),
      ],
    );
  }
}