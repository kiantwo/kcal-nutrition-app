import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int activeIndex = 0;

  final onBoardingInfo = [
    {
      'img': const AssetImage('images/eat-healthy.png'),
      'title': 'Eat Healthy',
      'subtitle':
          'Maintaining good health should be the primary focus of everyone.',
    },
    {
      'img': const AssetImage('images/healthy-recipes.png'),
      'title': 'Healthy Recipes',
      'subtitle':
          'Browse thousands of healthy recipes from all over the world.',
    },
    {
      'img': const AssetImage('images/track-health.png'),
      'title': 'Track Your Health',
      'subtitle': 'With amazing inbuilt tools you can track your progress.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              _buildAppLogo(),
              _buildCarousel(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: const Text(
        'kcal',
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 32.0,
            color: Color(0Xff91c789)),
      ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 405,
            enableInfiniteScroll: false,
            initialPage: 0,
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: onBoardingInfo.length,
          itemBuilder: (context, index, realIndex) => _buildOnBoardingDetails(
            headerImg: onBoardingInfo[index]['img'] as ImageProvider,
            detailsHeader: onBoardingInfo[index]['title'] as String,
            detailsText: onBoardingInfo[index]['subtitle'] as String,
            context: context,
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: onBoardingInfo.length,
          effect: ScrollingDotsEffect(
              spacing: 6.0,
              radius: 8.0,
              dotWidth: 16.0,
              dotHeight: 9.0,
              dotColor: Colors.red.shade100,
              activeDotColor: Colors.redAccent.shade100),
        ),
      ],
    );
  }

  Widget _buildOnBoardingDetails(
      {required ImageProvider headerImg,
      required String detailsHeader,
      required String detailsText,
      context}) {
    return SizedBox(
      width: 400.0,
      child: Column(
        children: [
          Image(
            image: headerImg,
            height: 300.0,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  detailsHeader,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  detailsText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 15.0),
          child: ElevatedButton(
              child: const Text('Get Started'), onPressed: () {}),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already Have An Account? ',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              'Log In',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0Xff91c789),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
