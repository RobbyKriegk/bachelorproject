import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapproject/image_demo/choose_poi_button.dart';
import 'package:mapproject/image_demo/poilayer.dart';
import 'package:mapproject/image_demo/provider.dart';
import 'package:mapproject/image_demo/self_position_layer.dart';

class ImageDemo extends ConsumerStatefulWidget {
  const ImageDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImageDemoState();
}

class _ImageDemoState extends ConsumerState<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    ref.watch(switchStateProvider);
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(children: <Widget>[
          Image(image: AssetImage('assets/images/fluchtplan.jpeg')),
          PoILayer(),
          SelfPositionLayer()
        ]),
        ChoosePOIButton()
      ],
    );
  }
}
