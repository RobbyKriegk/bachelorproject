import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapproject/image_demo/provider.dart';

class SelfPositionLayer extends ConsumerStatefulWidget {
  const SelfPositionLayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelfPositionLayerState();
}

class _SelfPositionLayerState extends ConsumerState<SelfPositionLayer> {
  GlobalKey keyL1 = GlobalKey();
  GlobalKey keyL2 = GlobalKey();
  positionPresentation(String number, GlobalKey key, bool selected) {
    return Text(' L$number',
        key: key,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: selected == false ? Colors.white : Colors.pink,
          backgroundColor: Colors.blue,
        ));
  }

  void calculateDistance(GlobalKey key1, GlobalKey key2) {
    if (key1.currentContext == null || key2.currentContext == null) {
      return;
    }
    final RenderBox box1 = key1.currentContext!.findRenderObject() as RenderBox;
    final RenderBox box2 = key2.currentContext!.findRenderObject() as RenderBox;

    final position1 = box1.localToGlobal(Offset.zero);
    final position2 = box2.localToGlobal(Offset.zero);

    ref.read(locationProvider.notifier).state['location1']['offset'] =
        position1;
    ref.read(locationProvider.notifier).state['location2']['offset'] =
        position2;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> locationList = ref.read(locationProvider);
    calculateDistance(keyL1, keyL2);
    ref.watch(switchStateProvider);
    return Column(
      children: [
        const SizedBox(height: 110),
        Row(
          children: [
            const SizedBox(
              width: 270,
            ),
            positionPresentation(
                '2', keyL2, locationList['location2']['selected']),
          ],
        ),
        const SizedBox(height: 180),
        Row(
          children: [
            const SizedBox(
              width: 240,
            ),
            positionPresentation(
                '1', keyL1, locationList['location1']['selected']),
          ],
        ),
      ],
    );
  }
}
