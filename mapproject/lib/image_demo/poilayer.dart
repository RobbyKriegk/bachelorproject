import 'package:flutter/material.dart';
import 'package:mapproject/image_demo/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoILayer extends ConsumerStatefulWidget {
  const PoILayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PoILayerState();
}

class _PoILayerState extends ConsumerState<PoILayer> {
  poiPresentation(String poiKey, bool selected) {
    return Text(poiKey,
        style: TextStyle(
          fontSize: 15,
          color: selected == true ? const Color(0xFF39FF14) : Colors.black,
          backgroundColor: Colors.red,
        ));
  }

  // neon green as full colorcode
  // c

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> poiList = ref.read(poiListProvider);
    ref.watch(switchStateProvider);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 110),
      Row(
        children: [
          const SizedBox(
            width: 170,
          ),
          poiPresentation(
              poiList['list'][4]['key'], poiList['list'][4]['selected']),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          const SizedBox(
            width: 250,
          ),
          poiPresentation(
              poiList['list'][3]['key'], poiList['list'][3]['selected']),
        ],
      ),
      const SizedBox(height: 90),
      Row(
        children: [
          const SizedBox(
            width: 220,
          ),
          poiPresentation(
              poiList['list'][2]['key'], poiList['list'][2]['selected']),
          const SizedBox(
            width: 40,
          ),
          poiPresentation(
              poiList['list'][1]['key'], poiList['list'][1]['selected']),
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
            poiList['list'][0]['selected'],
          ),
        ],
      ),
    ]);
  }
}
