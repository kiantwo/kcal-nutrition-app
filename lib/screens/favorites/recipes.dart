import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kcal_nutrition_app/classes/recipe.dart';
import 'package:kcal_nutrition_app/screens/favorites/components/nodata.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'components/imagehero.dart';

class Recipes extends StatefulWidget {
  const Recipes({Key? key, required this.recipeList}) : super(key: key);

  final List<Recipe> recipeList;

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return widget.recipeList.isNotEmpty
        ? _buildRecipeList()
        : const NoData(
            subject: 'Recipe',
            image: AssetImage('images/recipe.png'),
          );
  }

  Widget _buildRecipeList() {
    return Container(
      height: 445.0,
      padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(widget.recipeList[index], index, context);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: widget.recipeList.length,
      ),
    );
  }

  Widget _buildCard(Recipe singleRecipe, int index, BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(24.0, 18.0),
          ),
        ),
        child: Column(
          children: [
            _buildCardImage(singleRecipe.thumbnail, index),
            Container(
              padding: const EdgeInsets.fromLTRB(24.0, 20.0, 0.0, 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(EvaIcons.clockOutline,
                          size: 18.0, color: Color(0xff4c4028)),
                      const SizedBox(width: 8.0),
                      Text(
                        singleRecipe.timeRequired.toString() + ' min',
                        style: const TextStyle(
                          color: Color(0xff4c4028),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14.0),
                  Row(
                    children: [
                      const Icon(EvaIcons.peopleOutline,
                          size: 18.0, color: Color(0xff4c4028)),
                      const SizedBox(width: 8.0),
                      Text(
                        singleRecipe.servingAmt.toString() + ' serve',
                        style: const TextStyle(
                          color: Color(0xff4c4028),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 76.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int i = 0; i < 5; i++)
                        i < singleRecipe.rating
                            ? Icon(IconlyBold.star,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 14.0)
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
                    fontSize: 16.0,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ],
        ),
        elevation: 0.0,
        color: const Color(0xfffefaef),
      ),
      onTap: () async {
        final bool isPressed = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeInfo(recipe: widget.recipeList[index]),
          ),
        );

        setState(
          () {
            if (isPressed && widget.recipeList[index].isFavorited ||
                !isPressed && widget.recipeList[index].isFavorited) {
              widget.recipeList[index].isFavorited = true;
            } else {
              widget.recipeList[index].isFavorited = false;
            }
          },
        );
      },
    );
  }

  Widget _buildCardImage(ImageProvider thumbnail, int i) {
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
            child: widget.recipeList[i].isFavorited
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 28.0,
                  )
                : const Icon(Icons.favorite_outline_rounded,
                    color: Colors.white, size: 28.0),
            onTap: () => addFavorite(i),
          ),
        ),
      ],
    );
  }

  void addFavorite(int i) {
    setState(
      () {
        if (widget.recipeList[i].isFavorited) {
          widget.recipeList[i].isFavorited = false;
        } else {
          widget.recipeList[i].isFavorited = true;
        }
      },
    );
  }
}

/* RECIPE DETAIL PAGE */

class RecipeInfo extends StatefulWidget {
  const RecipeInfo({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  final _favoriteSnackBar =
      const SnackBar(content: Text('Added to Favorites.'));
  final _unfavoriteSnackBar =
      const SnackBar(content: Text('Removed from Favorites.'));
  bool _favoritePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, _favoritePressed);
          },
          icon: const Icon(IconlyLight.arrowLeft2),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 75.0,
        title: const Text(
          'Recipes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: 600.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            _buildBanner(context),
            _buildInfo(),
            _buildIngredients(),
            _buildSteps(widget.recipe.steps),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Add to Favorite'),
        onPressed: () {
          _addFavorite();
        },
        style: ElevatedButton.styleFrom(elevation: 10.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomSheet: const Padding(padding: EdgeInsets.only(bottom: 65.0)),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18.0),
          child: InkWell(
            child: Hero(
              tag: widget.recipe.name + 'Image',
              child: Image(
                image: widget.recipe.thumbnail,
                fit: BoxFit.cover,
                height: 200.0,
                width: 500.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewImage(img: widget.recipe.thumbnail);
                  },
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(28.0, 18.0, 0.0, 18.0),
          margin: const EdgeInsets.fromLTRB(28.0, 18.0, 32.0, 0.0),
          decoration: const BoxDecoration(
            color: Color(0xfffefaef),
            borderRadius: BorderRadius.all(
              Radius.elliptical(24, 18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(EvaIcons.clockOutline,
                      size: 20.0, color: Color(0xff4c4028)),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.recipe.timeRequired.toString() + ' min',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff4c4028),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8.0),
              Row(
                children: [
                  const Icon(
                    EvaIcons.peopleOutline,
                    size: 20.0,
                    color: Color(0xff4c4028),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.recipe.servingAmt.toString() + ' serve',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff4c4028),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 28.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (int i = 0; i < 5; i++)
                    i < widget.recipe.rating
                        ? Icon(IconlyBold.star,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 18.0)
                        : Icon(IconlyBold.star,
                            color: Colors.grey.shade400, size: 18.0),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 36.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.0,
                child: Text(
                  widget.recipe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    height: 1.5,
                  ),
                ),
              ),
              InkWell(
                child: widget.recipe.isFavorited
                    ? const Icon(
                        Icons.favorite_rounded,
                        size: 28.0,
                        color: Color(0Xff91c789),
                      )
                    : const Icon(
                        Icons.favorite_outline_rounded,
                        size: 28.0,
                        color: Color(0Xff91c789),
                      ),
                onTap: () {
                  _addFavorite();
                },
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          child: Text(
            widget.recipe.description,
            style: const TextStyle(
              fontSize: 18.0,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24.0, bottom: 18.0),
          child: const Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 170.0,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                //add space on the left of first item
                return Container(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: _buildIngredientItem(
                        context, widget.recipe.ingredients[index]));
              } else if (index == widget.recipe.ingredients.length - 1) {
                //add space on the right of last item
                return Container(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: _buildIngredientItem(
                        context, widget.recipe.ingredients[index]));
              }
              return _buildIngredientItem(
                  context, widget.recipe.ingredients[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 7.0),
            itemCount: widget.recipe.ingredients.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(BuildContext context, Ingredient ingredient) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 100.0,
          width: 100.0,
          decoration: const BoxDecoration(
            color: Color(0xfffafcf9),
            borderRadius: BorderRadius.all(Radius.elliptical(24, 18)),
          ),
          child: InkWell(
            child: Hero(
              tag: ingredient.name + 'Image',
              child: Image(
                image: ingredient.img,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewImage(img: ingredient.img);
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: 100.0,
          child: Text(
            ingredient.name,
            style: const TextStyle(
              color: Color(0xff6c6e6b),
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.clip,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          ingredient.measurements,
          style: const TextStyle(
            color: Color(0xff767b77),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSteps(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24.0, top: 18.0, bottom: 10.0),
          child: const Text(
            'Directions',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        for (int i = 0; i < widget.recipe.steps.length; i++)
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step ' + (i + 1).toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff565b57),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.recipe.steps[i],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        const Padding(padding: EdgeInsets.only(bottom: 120.0)),
      ],
    );
  }

  void _addFavorite() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(
      () {
        if (widget.recipe.isFavorited) {
          _favoritePressed = false;
          widget.recipe.isFavorited = false;
          ScaffoldMessenger.of(context).showSnackBar(_unfavoriteSnackBar);
        } else if (!widget.recipe.isFavorited) {
          _favoritePressed = true;
          widget.recipe.isFavorited = true;
          ScaffoldMessenger.of(context).showSnackBar(_favoriteSnackBar);
        }
      },
    );
  }
}
