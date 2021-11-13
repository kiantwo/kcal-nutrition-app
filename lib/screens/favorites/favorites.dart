import 'package:flutter/material.dart';
import 'package:kcal_nutrition_app/classes/food.dart';
import 'package:kcal_nutrition_app/classes/recipe.dart';
import 'package:kcal_nutrition_app/components/navbar.dart';
import 'package:kcal_nutrition_app/screens/favorites/foods.dart';
import 'package:kcal_nutrition_app/screens/favorites/recipes.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int activeIndex = 0;
  List<bool> isSelected = [true, false];

  List<Food> food = [];
  List<Recipe> recipe = [];

  @override
  void initState() {
    setState(() {
      //populate Favorite Food
      populateFood();
      populateRecipe();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75.0,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildToggleButtons(),
            isSelected[0] ? Foods(food: food) : Recipes(recipe: recipe),
          ],
        ),
      ),
      bottomNavigationBar: buildNavBar(context),
    );
  }

  Widget _buildToggleButtons() {
    return ToggleButtons(
      fillColor: const Color(0Xff91c789),
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      selectedColor: Colors.white,
      color: const Color(0Xff91c789),
      //f4f9f3
      borderRadius: const BorderRadius.all(Radius.elliptical(24, 16)),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 55.0,
            vertical: 15.0,
          ),
          color:
              isSelected[0] ? const Color(0Xff91c789) : const Color(0xfff4f9f3),
          child: const Text(
            'Foods',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 15.0,
          ),
          color:
              isSelected[1] ? const Color(0Xff91c789) : const Color(0xfff4f9f3),
          child: const Text(
            'Recipes',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      isSelected: isSelected,
    );
  }

  void populateFood() {
    food = [
      Food(
        name: 'Cookie',
        altName: 'Biscuit',
        description:
            "A cookie is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, nuts, etc.\n\nIn most English-speaking countries except for the United States, crunchy cookies are called biscuits. Many Canadians also use this term. Chewier biscuits are sometimes called cookies even in the United Kingdom.[3] Some cookies may also be named by their shape, such as date squares or bars.",
        mainImage: const AssetImage('images/food/cookie.png'),
        gallery: [
          const NetworkImage(
              'https://www.sweetestmenu.com/wp-content/uploads/2019/06/classiccookies10a.jpg'),
          const NetworkImage(
              'https://tastesbetterfromscratch.com/wp-content/uploads/2018/05/Chocolate-Chip-Cookies-2.jpg'),
          const NetworkImage(
              'https://cdn.loveandlemons.com/wp-content/uploads/2020/12/cookie-recipes.jpg'),
        ],
      ),
      Food(
        name: 'Burger',
        altName: 'Hamburger sandwich',
        description:
            "A hamburger (or burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties—usually ground meat, typically beef—placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a \"special sauce\", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]\n\nThe term burger can also be applied to the meat patty on its own, especially in the United Kingdom, where the term patty is rarely used, or the term can even refer simply to ground beef. Since the term hamburger usually implies beef, for clarity burger may be prefixed with the type of meat or meat substitute used, as in beef burger, turkey burger, bison burger, portobello burger, or veggie burger.",
        mainImage: const AssetImage('images/food/burger.png'),
        gallery: [
          const NetworkImage(
              'https://thedefineddish.com/wp-content/uploads/2020/02/2020-02-17-03.09.55.jpg'),
          const NetworkImage(
              'https://cookieandkate.com/images/2013/05/best-veggie-burger-recipe-3.jpg'),
          const NetworkImage(
              'https://www.thespruceeats.com/thmb/l4w6PvMqsz1EjueCAh_foPmYafM=/3456x3456/smart/filters:no_upscale()/garlic-burger-patties-333503-hero-01-e4df660ff27b4e5194fdff6d703a4f83.jpg'),
        ],
      ),
      Food(
        name: 'Cakes',
        altName: 'Muffin',
        description:
            "Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies.\n\nThe most commonly used cake ingredients include flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients. Cakes can also be filled with fruit preserves, nuts or dessert sauces (like pastry cream), iced with buttercream or other icings, and decorated with marzipan, piped borders, or candied fruit.[1]",
        mainImage: const AssetImage('images/food/cake.png'),
        gallery: [
          const NetworkImage(
              'https://natashaskitchen.com/wp-content/uploads/2020/05/Vanilla-Cupcakes-3.jpg'),
          const NetworkImage(
              'https://thescranline.com/wp-content/uploads/2021/03/Vanilla-Cupcakes.jpg'),
          const NetworkImage(
              'https://www.theflavorbender.com/wp-content/uploads/2020/06/Chocolate-Cupcakes-SM-5629.jpg'),
        ],
      ),
      Food(
        name: 'Pizza',
        altName: 'Pie or Pizza Pie',
        description:
            "Pizza (Italian: [ˈpittsa], Neapolitan: [ˈpittsə]) is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.), which is then baked at a high temperature, traditionally in a wood-fired oven.[1] A small pizza is sometimes called a pizzetta. A person who makes pizza is known as a pizzaiolo.\n\nIn Italy, pizza served in formal settings, such as at a restaurant, is presented unsliced, and is eaten with the use of a knife and fork.[2][3] In casual settings, however, it is cut into wedges to be eaten while held in the hand.",
        mainImage: const AssetImage('images/food/pizza.png'),
        gallery: [
          const NetworkImage(
              'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/Pizza-from-Scratch_EXPS_FT20_8621_F_0505_1_home.jpg'),
          const NetworkImage(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190731-air-fryer-pizza-0202-landscape-pf-1565820595.jpg'),
          const NetworkImage(
              'https://www.kingarthurbaking.com/sites/default/files/styles/featured_image/public/2020-03/hawaiian-pizza.jpg?itok=a1-_QjRA'),
        ],
      ),
      Food(
        name: 'Hotdog',
        altName: 'Frankfurter',
        description:
            "A hot dog[1][2] (less commonly spelled hotdog[3]) is a dish consisting of a grilled or steamed sausage served in the slit of a partially sliced bun.[4] The term hot dog can also refer to the sausage itself. The sausage used is a wiener (Vienna sausage) or a frankfurter (Frankfurter Würstchen, also just called frank). The names of these sausages also commonly refer to their assembled dish.[5] Hot dog preparation and condiments vary worldwide. Typical condiments include mustard, ketchup, mayonnaise, relish, and cheese sauce,[citation needed] and common garnishes include onions, sauerkraut, jalapeños, chili, grated cheese, coleslaw, bacon, and olives.[citation needed] Hot dog variants include the corn dog and pigs in a blanket. The hot dog's cultural traditions include the Nathan's Hot Dog Eating Contest and the Oscar Mayer Wienermobile.",
        mainImage: const AssetImage('images/food/hotdog.png'),
        gallery: [
          const NetworkImage(
              'https://cdn.leitesculinaria.com/wp-content/uploads/2021/05/perfect-hot-dog.jpg.optimal.jpg'),
          const NetworkImage(
              'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_27/1586837/hotdogs-te-main-200702.jpg'),
          const NetworkImage(
              'https://media.istockphoto.com/photos/hotdog-picture-id185123377?b=1&k=20&m=185123377&s=170667a&w=0&h=m1L2w5WFqYOsXvpSEybhUifdhhwQUJCZY2YY-bFPyeE='),
        ],
      ),
      Food(
        name: 'Fries',
        altName: 'Chips',
        description:
            "French fries (North American English), chips (British English),[1] finger chips (Indian English),[2] French-fried potatoes, or simply fries are batonnet or allumette-cut[3] deep-fried potatoes, originating from either Belgium or France. They are prepared by cutting the potato into even strips, then drying and frying it, usually in a deep fryer. Most french fries are produced from frozen Russet potatoes.\n\nFrench fries are served hot, either soft or crispy, and are generally eaten as part of lunch or dinner or by themselves as a snack, and they commonly appear on the menus of diners, fast food restaurants, pubs, and bars. They are often salted and may be served with ketchup, vinegar, mayonnaise, tomato sauce, or other local specialties. Fries can be topped more heavily, as in the dishes of poutine or chili cheese fries. Chips can be made from sweet potatoes instead of potatoes. A baked variant, oven chips, uses less oil or no oil.[4]",
        mainImage: const AssetImage('images/food/fries.png'),
        gallery: [
          const NetworkImage(
              'https://thecozycook.com/wp-content/uploads/2020/02/Copycat-McDonalds-French-Fries-.jpg'),
          const NetworkImage(
              'https://40aprons.com/wp-content/uploads/2020/03/air-fryer-french-fries-4.jpg'),
          const NetworkImage(
              'https://www.thespruceeats.com/thmb/tXRCQhaBACOilf8tnzLhaW0uzbE=/3485x1960/smart/filters:no_upscale()/how-to-make-homemade-french-fries-2215971-hero-01-02f62a016f3e4aa4b41d0c27539885c3.jpg'),
        ],
      ),
      Food(
        name: 'Donuts',
        altName: 'Doughnut',
        description:
            "A doughnut or donut (IPA: /doʊnət/) is a type of leavened fried dough.[1]: 275  It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors. Doughnut is the traditional spelling, while donut is the simplified version; the terms are often used interchangeably.\n\nDoughnuts are usually deep fried from a flour dough, but other types of batters can also be used. Various toppings and flavorings are used for different types, such as sugar, chocolate or maple glazing. Doughnuts may also include water, leavening, eggs, milk, sugar, oil, shortening, and natural or artificial flavors.[1]: 232 [2][3][4][5]",
        mainImage: const AssetImage('images/food/donut.png'),
        gallery: [
          const NetworkImage(
              'https://www.womanscribbles.net/wp-content/uploads/2020/01/basic-fried-donuts-3-720x720.jpg'),
          const NetworkImage(
              'http://cdn.sallysbakingaddiction.com/wp-content/uploads/2016/07/frosted-doughnuts-3-ways.jpg'),
          const NetworkImage(
              'https://prettysimplesweet.com/wp-content/uploads/2019/07/Chocolate-Donuts.jpg'),
        ],
      ),
    ];
  }

  void populateRecipe() {
    recipe = [
      Recipe(
        name: 'Steak with Blistered Summer Vegetables & Fish Sauce Dressing',
        description:
            "If the weather is good, try cooking this on the barbecue rather than indoors to give it that lovely smoky flavour.",
        subDescription:
            "Donald Skehan's special steak with vegetables and fish sauce dressing.",
        timeRequired: 25,
        servingAmt: 4,
        ingredients: [
          Ingredient(
            name: 'Sirloin Steak',
            measurements: '450gm',
            img: const NetworkImage(
                'https://embed.widencdn.net/img/beef/melpznnl7q/800x600px/Top%20Sirloin%20Steak.psd?keep=c&u=7fueml'),
          ),
        ],
        steps: [
          "Put the steak in a dish with a drizzle of oil, the fish sauce and plenty of black pepper. Set aside.",
          "Place a griddle pan over a high heat. Toss the vegetables in a little oil, then griddle them for 2 to 3 minutes on all sides, or until lightly charred. Tip into a serving dish.",
          "Remove the steak from the marinade, add to the pan and griddle for 1 to 2 minutes each side. Remove from the pan and set aside to rest.",
          "To make the dressing, put the lime juice, fish sauce and sugar into a bowl and whisk until the sugar has dissolved, then whisk in the oils.",
          "Slice the steak into generous slices and arrange on top of the griddled veggies. Scatter with the cilantro leaves and peanuts, drizzle over the dressing and serve.",
        ],
        thumbnail: const NetworkImage(
            'https://food.fnr.sndimg.com/content/dam/images/food/plus/fullset/2020/07/28/0/SEJI104_Steak-with-Blistered-Summer-Vegetables_s4x3.jpg.rend.hgtvcom.826.620.suffix/1595957872708.jpeg'),
        rating: 5,
      ),
      Recipe(
        name: 'Air Fryer Steak with Garlic-Herb Butter',
        description:
            "Yes, you can even cook steak in an air fryer! We found that thicker cuts, like sirloin, are best -- they turn nice and browned on the outside without overcooking. Plus, there's very little clean up. We added a homemade garlic-herb butter to melt over the steak for a quick and flavorful weeknight dinner.",
        subDescription:
            "Steak cooked in an air fryer with homemade garlic herb butter.",
        timeRequired: 30,
        servingAmt: 2,
        ingredients: [
          Ingredient(
            name: 'Sirloin Steak',
            measurements: '1lb',
            img: const NetworkImage(
                'https://food.fnr.sndimg.com/content/dam/images/food/plus/fullset/2020/07/28/0/SEJI104_Steak-with-Blistered-Summer-Vegetables_s4x3.jpg.rend.hgtvcom.826.620.suffix/1595957872708.jpeg'),
          ),
        ],
        steps: [
          "Allow the steak to sit at room temperature for 30 minutes before cooking.",
          "Preheat a 3.5-quart air fryer to 400 degrees F. Season the steak on both sides with a generous pinch of salt and several grinds of black pepper. Place the steak in the center of the air fryer basket and cook until desired doneness, about 10 minutes for medium-rare, 12 minutes for medium and 14 minutes for medium-well. Transfer the steak to a cutting board and allow to rest, about 10 minutes. ",
          "Meanwhile, mash together the butter, parsley, chives, garlic and crushed red pepper in a small bowl until combined. Slice the steak against the grain into 1/4-inch-thick pieces. Top with the garlic-herb butter.",
        ],
        thumbnail: const NetworkImage(
            'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/04/27/FN_FNK_Air-Fryer-Steak-With-Garlic-Herb-Butter_s4x3.jpg.rend.hgtvcom.826.620.suffix/1588019651595.jpeg'),
        rating: 5,
      ),
      Recipe(
        name: 'Roast Chicken with Green Herb Stuffing',
        description:
            "A great way to infuse chicken with flavor? Stuff seasonings right underneath the skin. That way as the chicken cooks, it bathes the meat in the flavor of the seasonings.\n\nIn this recipe we are using a mix of fresh chopped herbs and some salt and pepper to season our chicken. The recipe comes (barely adapted) from Jamie Oliver, in his wonderful book Naked Chef.",
        subDescription:
            "Whole roasted chicken, infused with fresh herbs - parsley, basil, thyme, oregano.",
        timeRequired: 90,
        servingAmt: 6,
        ingredients: [
          Ingredient(
            name: 'Chicken',
            measurements: '4 1/2lbs',
            img: const NetworkImage(
                'https://pngimg.com/uploads/fried_chicken/fried_chicken_PNG97927.png'),
          ),
        ],
        steps: [
          "Wash the chicken under cool running water and pat it dry with paper towels. Refrigerate, uncovered, for at least 12 hours and as long as 2 days.",
          "Preheat the oven to 425 degrees F. Oil a roasting or baking pan with canola oil.",
          "Make the stuffing: Put the breadcrumbs in a medium bowl. Heat a large skillet over medium-high heat. Sprinkle the liver and gizzard with salt and pepper. Add 1 tablespoon of the butter to the skillet and when it melts, add the giblets and cook quickly until browned on both sides, about 3 minutes. Transfer them to a cutting board, chop finely and add to the breadcrumbs. Off of the heat, add the wine and scrape the bottom of the skillet to dislodge the brown bits; pour the liquid onto the breadcrumbs and mix.",
          "Add the pork to the skillet and cook until browned, about 5 minutes; scrape the pork into the bowl with the bread mixture. Add 3 tablespoons of the butter, the onions and 1/4 teaspoon each salt and pepper to the skillet and cook over medium heat until the onions are soft and tender, 10 to 15 minutes. Add the sage and garlic and cook 1 minute longer. Add the Swiss chard and cook until wilted. Scrape the mixture and all the buttery juices onto the breadcrumbs and mix to combine. Add the chives and lemon zest and taste for seasoning, adding more salt and pepper if needed.",
          "Loosen the skin over the chicken breasts. Insert the remaining 4 tablespoons cold butter under the skin of the chicken breasts, pushing down to disperse them. Rub the chicken all over with a thin film of canola oil. Sprinkle the chicken heavily on all sides with 3/4 teaspoon each salt and pepper. Stuff the cavity with the bread mixture, and stuff the neck skin with any remaining stuffing. Set the bird in the oiled roasting pan.",
          "Roast the chicken until the skin dries and the butter melts, about 15 minutes. Turn the heat down to 375 degrees F and continue to roast, basting the chicken once or twice with the fat that accumulates in the corners of the pan, until the thickest part of the thigh registers 170 degrees F on an instant-read thermometer, 45 to 55 minutes.",
          "Transfer the chicken to a large platter to rest for 5 to 10 minutes. Strain the pan juices into a bowl and skim off the fat. Pour 1/4 cup water into the roasting pan, set it on a burner on high heat and scrape up any stuck-on bits on the bottom with a rubber spatula. Return the defatted juices to the pan and simmer together for 3 to 5 minutes to make a thin, natural gravy. Season with salt and pepper.",
          "Carve the chicken on the platter. Slice the wings at the joint, twist to remove them and set them above the chicken. Cut the thighs at the joint, twist to remove them, slice them diagonally at the leg joint to separate them into thigh and drumstick and lay them on the platter. Carve thin slices from the breast meat and let them lay as they fall; pour a little gravy over the white meat, avoiding wetting the crispy skin of the thighs. Cut the stuffed neck in slices, and serve with the rest of the gravy in a small pitcher on the side."
        ],
        thumbnail: const NetworkImage(
            'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/8/21/0/HB0103_Chicken_s4x3.jpg.rend.hgtvcom.826.620.suffix/1393524974449.jpeg'),
        rating: 5,
      ),
      Recipe(
        name: 'Philly Cheese Steak',
        description:
            "It's hard to think of Philadelphia without thinking of the cheesesteak, a sandwich containing chopped steak, melted cheese and sometimes peppers and onions. The big cheese steak debate, ongoing between rival restaurants Pat's and Geno's, is whether the steak should be topped with Provolone or American cheese, or canned cheese whiz. Bobby Flay's loaded cheese steak recipe is topped with a melted Provolone sauce, onions, peppers and mushrooms.",
        subDescription:
            "Sandwich with chopped steak, melted cheese and sometimes pepper and onions. A Philadelphia classic.",
        timeRequired: 129,
        servingAmt: 4,
        ingredients: [
          Ingredient(
            name: 'Strip Loin',
            measurements: '2 1/2lbs',
            img: const NetworkImage(
                'https://embed.widencdn.net/img/beef/uerwtoubqu/exact/Strip%20Loin.psd?keep=c&u=7fueml'),
          ),
        ],
        steps: [
          "Place steak in freezer for 30 to 45 minutes; this makes it easier to slice the meat. Remove the meat from the freezer and slice very thinly.",
          "Heat griddle or grill pan over high heat. Brush steak slices with oil and season with salt and pepper. Cook for 45 to 60 seconds per side.",
          "Place several slices of the meat on the bottom half of the roll, spoon some of the cheese sauce over the meat, and top with the mushrooms, onions, and peppers.",
          "Melt butter in a medium saucepan over medium heat. Whisk in the flour and cook for 1 minute. Slowly whisk in the warm milk, and cook, whisking constantly until thickened, about 4 to 5 minutes. Remove the mixture from the heat and whisk in the provolone and Parmesan until combined; season with the salt and pepper.",
          "Heat oil and butter in a large saute pan over high heat. Add the mushrooms and cook until the mushrooms are golden brown. Stir in the parsley and season with salt and pepper.",
          "Heat butter and oil in a large saute pan over medium heat. Add the onions, season with salt and pepper, and cook slowly until golden brown and caramelized, stirring occasionally, approximately 30 to 40 minutes.",
          "Heat the oil in medium saute pan over high heat. Add the peppers and cook until soft. Season with salt and pepper.",
        ],
        thumbnail: const NetworkImage(
            'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/5/21/0/CC_Philly-Cheese-Steak-Recipe_s4x3.jpg.rend.hgtvcom.826.620.suffix/1382541461570.jpeg'),
        rating: 4,
      ),
      Recipe(
        name: 'Pan Seared T-Bone Steak',
        description:
            "Stay in and bring the steakhouse to you. It's easier than you think to make a juicy, perfectly-seared T-bone at home. A hot pan and a few ingredients are all you need for this impressive dinner.",
        subDescription:
            "Pan-seared T-bone steak cooked in a cast iron skillet.",
        timeRequired: 15,
        servingAmt: 2,
        ingredients: [
          Ingredient(
            name: 'T-bone steak',
            measurements: '1/2lb',
            img: const NetworkImage(
                'https://embed.widencdn.net/img/beef/ct62lm01nw/800x600px/T-Bone%20Steak.psd?keep=c&u=7fueml'),
          ),
        ],
        steps: [
          "Preheat the oven to 450 degrees F. A half-hour before cooking, remove steak from refrigerator.",
          "Heat a large skillet over high heat. Pat steak dry and season generously with salt and pepper. Add oil to hot skillet and when it begins to smoke add steak. Reduce heat slightly and cook steak until browned, about 4 minutes on each side. Transfer skillet to the oven. Roast until an instant-read thermometer inserted sideways into the steak registers 120 degrees F for medium-rare, about 6 to 8 minutes. Transfer steak to a cutting board and let it rest for 10 minutes. Cut steak from the bone and carve meat across the grain.",
        ],
        thumbnail: const NetworkImage(
            'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2007/1/2/0/valentines_steak.jpg.rend.hgtvcom.826.620.suffix/1557859049553.jpeg'),
        rating: 5,
      ),
    ];
  }
}
