import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kcal_nutrition_app/classes/recipe.dart';
import 'package:kcal_nutrition_app/screens/favorites/components/nodata.dart';

class Recipes extends StatefulWidget {
  Recipes({Key? key, required this.recipe}) : super(key: key);

  List<Recipe> recipe = [];

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return widget.recipe.isNotEmpty
        ? buildRecipeList()
        : const NoData(
            subject: 'Recipe',
            image: AssetImage('images/recipe.png'),
          );
  }

  Widget buildRecipeList() {
    return Container(
      height: 445.0,
      padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return buildCard(widget.recipe[index], index, context);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: widget.recipe.length,
      ),
    );
  }

  Widget buildCard(Recipe singleRecipe, int index, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(24.0, 18.0)),
      ),
      child: Column(
        children: [
          buildCardImage(singleRecipe.thumbnail, index),
          Container(
            padding: const EdgeInsets.fromLTRB(24.0, 20.0, 0.0, 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(IconlyLight.timeCircle, size: 18.0),
                    const SizedBox(width: 8.0),
                    Text(singleRecipe.timeRequired.toString() + ' min'),
                  ],
                ),
                const SizedBox(width: 14.0),
                Row(
                  children: [
                    const Icon(IconlyLight.user2, size: 18.0),
                    const SizedBox(width: 8.0),
                    Text(singleRecipe.servingAmt.toString() + ' serve'),
                  ],
                ),
                const SizedBox(width: 76.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < 5; i++)
                      i < singleRecipe.rating
                          ? Icon(IconlyBold.star,
                              color: Theme.of(context).primaryColor, size: 14.0)
                          : Icon(IconlyBold.star,
                              color: Colors.grey.shade400, size: 14.0),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Container(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
              child: Text(
                singleRecipe.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
            ),
            subtitle: Container(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
              child: Text(
                singleRecipe.subDescription,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14.5,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
      elevation: 0.0,
      color: const Color(0xfffefaef),
    );
  }

  Widget buildCardImage(ImageProvider thumbnail, int i) {
    return Stack(
      children: [
        Image(
          height: 150.0,
          width: 500.0,
          image: thumbnail,
          fit: BoxFit.cover,
        ),
        Container(
          alignment: Alignment.topRight,
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 24.0, 10.0),
          child: InkWell(
            child: widget.recipe[i].isFavorited
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 28.0,
                  )
                : const Icon(Icons.favorite_outline_rounded,
                    color: Colors.white, size: 28.0),
            onTap: () {
              setState(
                () {
                  if (widget.recipe[i].isFavorited) {
                    widget.recipe[i].isFavorited = false;
                  } else {
                    widget.recipe[i].isFavorited = true;
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
