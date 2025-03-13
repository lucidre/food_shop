import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/constants/numbers.dart';
import 'package:food_shop/constants/strings.dart';
import 'package:food_shop/constants/style.dart';
import 'package:food_shop/models/food.dart';
import 'package:food_shop/routing/app_router.gr.dart';

//ih

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: primaryColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: primaryColor);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: null,
        title: Row(
          children: [
            Text(
              'Break',
              style: bodyText1?.copyWith(
                fontWeight: FontWeight.w500,
                color: primaryColor,
                fontSize: 25,
              ),
            ),
            Text(
              'fast',
              style: bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 25,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: kDefaultMargin / 2, bottom: kDefaultMargin / 2),
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildSidebarItems(
                                "Seafood", bodyText2, false, () {}),
                            buildSidebarItems(
                                "Noodles", bodyText2, false, () {}),
                            buildSidebarItems('Bread', bodyText2, true, () {}),
                          ]),
                    ),
                  ),
                  const Expanded(
                    child: HomeBody(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_rounded,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: kDefaultMargin / 2,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildFilterItem('Beer', bodyText2, false, () {}),
                              buildFilterItem('Food', bodyText2, true, () {}),
                              buildFilterItem('Wine', bodyText2, false, () {}),
                              buildFilterItem(
                                  'Drinks', bodyText2, false, () {}),
                              buildFilterItem('Lorem', bodyText2, false, () {}),
                              buildFilterItem(
                                  'ispidium', bodyText2, false, () {}),
                            ],
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultMargin,
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(bodyText2),
    );
  }

  Container buildBottomAppBar(TextStyle? bodyText2) {
    return Container(
      padding: const EdgeInsets.all(
        kDefaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomAppbarItem(
              Icons.home_rounded, 'Home', bodyText2, true, () {}),
          buildBottomAppbarItem(
              Icons.download_rounded, 'Download', bodyText2, false, () {}),
          buildBottomAppbarItem(
              Icons.bookmark_rounded, 'Bookmarks', bodyText2, false, () {}),
          buildBottomAppbarItem(
              Icons.menu_rounded, 'Menu', bodyText2, false, () {}),
        ],
      ),
    );
  }

  Widget buildBottomAppbarItem(IconData iconData, String title,
          TextStyle? bodyText2, bool isSelected, VoidCallback onPressed) =>
      InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.only(
                left: kDefaultPadding / 4, right: kDefaultPadding / 4),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: isSelected
                      ? secondaryColor
                      : primaryColor.withOpacity(.4),
                ),
                if (isSelected)
                  const SizedBox(
                    width: kDefaultMargin / 4,
                  ),
                if (isSelected)
                  Text(
                    title,
                    style: bodyText2?.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ],
            )),
      );

  Widget buildSidebarItems(String title, TextStyle? bodyText2, bool isSelected,
          VoidCallback onPressed) =>
      InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Column(
              children: [
                Text(
                  title,
                  style: bodyText2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: secondaryColor),
                  )
              ],
            )),
      );
  Widget buildFilterItem(String title, TextStyle? bodyText2, bool isSelected,
          VoidCallback onPressed) =>
      InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
                color:
                    isSelected ? secondaryColor : primaryColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(kDefaultMargin / 4)),
            margin: const EdgeInsets.only(right: kDefaultMargin / 2),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Text(
                  title,
                  style: bodyText2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? lightColor : primaryColor),
                ),
              ],
            )),
      );
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  final _scrollNotifier = ValueNotifier(0.0);

  void _listener() {
    _scrollNotifier.value = _pageController.page ?? 0;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: primaryColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: primaryColor);

    return ValueListenableBuilder<double>(
      valueListenable: _scrollNotifier,
      builder: (_, scroll, __) => PageView.builder(
        controller: _pageController,
        itemCount: liste.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final food = liste[index];
          final double percentLeft = (-scroll + index + 1).clamp(0.9, 1.0);
          final double percentRight = (scroll - index + 1).clamp(0.9, 1.0);
          final double percentScaleLeft = pow(percentLeft, 0.8).toDouble();
          final double percentScaleRight = pow(percentRight, 0.8).toDouble();
          final scale = percentRight < 1 ? percentScaleRight : percentScaleLeft;
          debugPrint(
              '$percentLeft   $percentRight   $percentScaleLeft   $percentScaleRight   $scale');
          return Transform.scale(
            scaleY: scale,
            alignment: Alignment.centerRight,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                context.router.push(DetailsScreen(food: food));
              },
              child: Stack(
                children: [
                  Positioned(
                    right: 20,
                    top: 5,
                    left: 0,
                    bottom: 0,
                    child: Card(
                      color: food.color,
                      margin: const EdgeInsets.only(
                        right: kDefaultMargin / 2,
                        bottom: kDefaultMargin / 2,
                        top: kDefaultMargin / 2,
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Spacer(
                                flex: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.only(
                                        top: kDefaultMargin / 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: secondaryColor),
                                  ),
                                  const SizedBox(
                                    width: kDefaultMargin / 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: food.name1,
                                        child: Text(
                                          food.name1,
                                          style:
                                              bodyText2?.copyWith(fontSize: 24),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: kDefaultMargin / 4,
                                      ),
                                      Text(
                                        food.name2,
                                        style:
                                            bodyText1?.copyWith(fontSize: 26),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: kDefaultMargin / 4,
                              ),
                              Text(
                                loremIspidiumLong + loremIspidiumLong,
                                style: bodyText2,
                                maxLines: 6,
                              ),
                              const Spacer(),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      color: secondaryColor,
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefaultMargin * 2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(kDefaultPadding / 2),
                        child: Icon(
                          Icons.favorite_rounded,
                          color: lightColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 20,
                      child: Hero(
                        tag: food.image,
                        child: Image.asset(
                          food.image,
                          width: 200,
                          height: 200,
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
