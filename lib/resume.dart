import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  const Resume({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      child: Expanded(
        //contains a single child which is scrollable
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: customText(),
        ),
      ),
    );
  }

  Column customText() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        headingRow(),
        contactRow(),
        for (var i = 0; i < 10; i++) printItems(),
      ],
    );
  }

  printItems() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        itemsHeadingRow(),
        itemsDescriptionRow(),
        itemsDescriptionText(),
      ],
    );
  }

  Padding headingRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
          children: [
            Text(
              'John Doe',
              textAlign: TextAlign.left,
              style: textStyleHeading(18),
            )
          ],
        ),
    );
  }

  Padding contactRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'jdoe@mail.org',
            textAlign: TextAlign.left,
            style: textStyle(15),
          ),
          Text(
            '555-555-5555',
            textAlign: TextAlign.left,
            style: textStyle(15),
          ),
        ],
      ),
    );
  }

  Padding itemsHeadingRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          Text(
            'Software Engineer',
            textAlign: TextAlign.left,
            style: textStyle(16),
          )
        ],
      ),
    );
  }

  Padding itemsDescriptionRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Flutter Masters',
            textAlign: TextAlign.left,
            style: textStyle(14),
          ),
          Text(
            '2023 - Present',
            textAlign: TextAlign.left,
            style: textStyle(14),
          ),
          Text(
            'Portland, OR',
            textAlign: TextAlign.left,
            style: textStyle(14),
          ),
        ],
      ),
    );
  }

  Padding itemsDescriptionText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              textAlign: TextAlign.left,
              style: textStyle(14),
            ),
          )
        ],
      ),
    );
  }

  TextStyle textStyleHeading(double size) {
    return TextStyle(
      color: const Color.fromARGB(255, 0, 7, 49),
      fontWeight: FontWeight.bold,
      fontFamily: 'Albert',
      fontSize: size,
    );
  }

  TextStyle textStyle(double size) {
    return TextStyle(
      color: const Color.fromARGB(255, 0, 11, 74),
      fontFamily: 'Albert',
      fontSize: size,
    );
  }
}
