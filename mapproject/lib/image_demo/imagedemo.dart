import 'package:flutter/material.dart';
import 'package:mapproject/image_demo/choose_poi_button.dart';
import 'package:mapproject/image_demo/poilayer.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(children: <Widget>[
          Image(image: AssetImage('assets/images/fluchtplan.jpeg')),
          PoILayer()
        ]),
        ChoosePOIButton()
      ],
    );
  }
}
