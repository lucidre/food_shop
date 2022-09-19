import 'package:flutter/material.dart';
import 'package:food_shop/constants/numbers.dart';
import 'package:food_shop/constants/strings.dart';
import 'package:food_shop/constants/style.dart';
import 'package:food_shop/models/food.dart';

class DetailsScreen extends StatefulWidget {
  final Food food;
  const DetailsScreen({super.key, required this.food});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: primaryColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: primaryColor);
    return Scaffold(
      backgroundColor: widget.food.color,
      bottomNavigationBar: buildBottombar(bodyText1),
      body: buildBody(bodyText1, bodyText2),
    );
  }

  SingleChildScrollView buildBody(TextStyle? bodyText1, TextStyle? bodyText2) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildAppbar(),
          buildTitle(bodyText1),
          buildImage(bodyText2),
          const SizedBox(
            height: kDefaultMargin,
          ),
          buildBodyText(bodyText1, bodyText2),
        ],
      ),
    );
  }

  Container buildBodyText(TextStyle? bodyText1, TextStyle? bodyText2) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      constraints: const BoxConstraints(minHeight: 1000),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kDefaultMargin * 1.5),
            topRight: Radius.circular(kDefaultMargin * 1.5)),
        boxShadow: [
          BoxShadow(
              color: darkColor.withOpacity(.1),
              blurRadius: 8,
              offset: const Offset(
                0,
                -4,
              ))
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: kDefaultMargin / 2,
        ),
        Text(
          'Description',
          style: bodyText1,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
        Text(
          loremIspidiumLong + loremIspidiumLong + loremIspidiumLong,
          style: bodyText2,
        ),
        const SizedBox(
          height: kDefaultMargin,
        ),
        Text(
          'Directions',
          style: bodyText1,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
        buildDirectionItem(
          bodyText2,
          loremIspidiumLong,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
        buildDirectionItem(
          bodyText2,
          loremIspidiumLong,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
        buildDirectionItem(
          bodyText2,
          loremIspidiumLong,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
        buildDirectionItem(
          bodyText2,
          loremIspidiumLong,
        ),
        const SizedBox(
          height: kDefaultMargin / 4,
        ),
      ]),
    );
  }

  SizedBox buildImage(TextStyle? bodyText2) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIconItem1(Icons.timer_rounded, '3.3 HOURS', bodyText2),
                  buildIconItem1(Icons.person_rounded, '3 PEOPLE', bodyText2),
                  buildIconItem1(
                      Icons.fireplace_rounded, '2.2 CELCIUS', bodyText2),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: -100,
            child: Hero(
              tag: widget.food.image,
              child: Image.asset(
                widget.food.image,
                width: 300,
                height: 300,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildTitle(TextStyle? bodyText1) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding),
      child: Row(
        children: [
          Text(
            '${widget.food.name1} ',
            style: bodyText1?.copyWith(
              fontWeight: FontWeight.w500,
              color: primaryColor,
              fontSize: 30,
            ),
          ),
          Text(
            widget.food.name2,
            style: bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const BackButton(
        color: primaryColor,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Container buildBottombar(TextStyle? bodyText1) {
    return Container(
      decoration: BoxDecoration(color: lightColor, boxShadow: [
        BoxShadow(
          color: darkColor.withOpacity(.05),
          offset: const Offset(0, -2),
          blurRadius: 6,
        )
      ]),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '\$ 29.99',
              style: bodyText1?.copyWith(
                fontSize: 23,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(kDefaultMargin / 4),
            ),
            child: Text(
              'Add To Cart',
              style: bodyText1?.copyWith(
                color: lightColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildDirectionItem(
    TextStyle? bodyText2,
    String title,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(top: kDefaultMargin / 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: secondaryColor),
          ),
          const SizedBox(
            width: kDefaultMargin / 4,
          ),
          Expanded(
            child: Text(title, style: bodyText2),
          ),
        ],
      );

  buildIconItem1(IconData iconData, String text, TextStyle? bodyText2) =>
      Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding / 4, bottom: kDefaultPadding / 4),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 16,
              color: secondaryColor,
            ),
            const SizedBox(
              width: kDefaultMargin / 4,
            ),
            Text(
              text,
              style: bodyText2,
            ),
          ],
        ),
      );
}
