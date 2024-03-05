import 'package:flutter/material.dart';
import 'package:mapproject/image_demo/poi_list.dart';

class PoILayer extends StatefulWidget {
  const PoILayer({super.key});

  @override
  State<PoILayer> createState() => _PoILayerState();
}

class _PoILayerState extends State<PoILayer> {
  poiPresentation(String poiKey) {
    return Text(poiKey,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          backgroundColor: Colors.red,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 110),
      Row(
        children: [
          const SizedBox(
            width: 170,
          ),
          poiPresentation(poiList['list'][4]['key']),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          const SizedBox(
            width: 250,
          ),
          poiPresentation(poiList['list'][3]['key']),
        ],
      ),
      const SizedBox(height: 90),
      Row(
        children: [
          const SizedBox(
            width: 220,
          ),
          poiPresentation(poiList['list'][2]['key']),
          const SizedBox(
            width: 40,
          ),
          poiPresentation(poiList['list'][1]['key']),
        ],
      ),
      const SizedBox(height: 25),
      Row(
        children: [
          const SizedBox(
            width: 270,
          ),
          poiPresentation(
            poiList['list'][0]['key'],
          ),
        ],
      ),
    ]));
  }
}
