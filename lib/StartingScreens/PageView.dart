import 'package:flutter/material.dart';

import 'PageOne.dart';
import 'PageThree.dart';
import 'PageTwo.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const <Widget>[

          PageOne(),
        PageTwo(),
        PageThree()
      ],
    );
  }
}
