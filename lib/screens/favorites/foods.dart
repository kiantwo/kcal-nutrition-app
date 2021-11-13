import 'package:flutter/material.dart';
import 'package:kcal_nutrition_app/classes/food.dart';
import 'package:kcal_nutrition_app/screens/favorites/components/nodata.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Foods extends StatelessWidget {
  Foods({Key? key, required this.food}) : super(key: key);

  List<Food> food = [];

  @override
  Widget build(BuildContext context) {
    return food.isNotEmpty
        ? buildGrid(context)
        : const NoData(
            subject: 'Food',
            image: AssetImage('images/food.png'),
          );
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
      height: 425.0,
      child: GridView.count(
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.5 / 1,
        crossAxisCount: 2,
        children: List.generate(
          food.length,
          (index) {
            return InkWell(
              child: buildGridItem(index),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodInfo(food: food[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildGridItem(int i) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfffefaef),
        borderRadius: BorderRadius.all(Radius.elliptical(24, 18)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: food[i].mainImage,
            height: 50.0,
          ),
          Text(
            food[i].name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff4c4028),
            ),
          ),
          const Icon(
            IconlyLight.arrowRight2,
            color: Color(0xff998151),
          ),
        ],
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({Key? key, required this.food}) : super(key: key);
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrowLeft2),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 75.0,
        title: const Text(
          'Foods',
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
            buildBanner(),
            buildDescription(),
            buildGallery(),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Add to Favorite'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 10.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomSheet: const Padding(padding: EdgeInsets.only(bottom: 65.0)),
    );
  }

  Widget buildBanner() {
    return Container(
      margin: const EdgeInsets.only(left: 24.0, top: 18.0, right: 24.0),
      decoration: const BoxDecoration(
        color: Color(0xfffefaef),
        borderRadius: BorderRadius.all(
          Radius.elliptical(24, 18),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: food.mainImage,
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 220.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff998151),
                    ),
                  ),
                  Text(
                    'Alternative Names: ' + food.altName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4c4028),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
      child: Text(
        food.description,
        style: const TextStyle(
          fontSize: 18.0,
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget buildGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24.0, top: 18.0, bottom: 10.0),
          child: const Text(
            'Gallery',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Hero(
                  tag: 'foodImage$index',
                  child: Image(image: food.gallery[index]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ViewImage(foodImg: food.gallery[index]);
                      },
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10.0),
            itemCount: food.gallery.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 130.0)),
      ],
    );
  }
}

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.foodImg}) : super(key: key);

  final NetworkImage foodImg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'foodImg',
            child: Image(
              image: foodImg,
            ),
          ),
        ),
      ),
    );
  }
}
