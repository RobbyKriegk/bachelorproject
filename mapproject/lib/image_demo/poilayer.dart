import 'package:flutter/material.dart';
import 'package:mapproject/image_demo/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoILayer extends ConsumerStatefulWidget {
  const PoILayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PoILayerState();
}

class _PoILayerState extends ConsumerState<PoILayer> {
  GlobalKey key0 = GlobalKey();
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();

  poiPresentation(String poiKey, bool selected, GlobalKey key) {
    return Text(poiKey,
        key: key,
        style: TextStyle(
          fontSize: 15,
          color: selected == true ? const Color(0xFF39FF14) : Colors.black,
          backgroundColor: Colors.red,
        ));
  }

  void calculateXY(GlobalKey key0, GlobalKey key1, GlobalKey key2,
      GlobalKey key3, GlobalKey key4) {
    if (key1.currentContext == null ||
        key2.currentContext == null ||
        key3.currentContext == null ||
        key4.currentContext == null ||
        key0.currentContext == null) {
      return;
    }
    final RenderBox box1 = key1.currentContext!.findRenderObject() as RenderBox;
    final RenderBox box2 = key2.currentContext!.findRenderObject() as RenderBox;
    final RenderBox box3 = key3.currentContext!.findRenderObject() as RenderBox;
    final RenderBox box4 = key4.currentContext!.findRenderObject() as RenderBox;
    final RenderBox box0 = key0.currentContext!.findRenderObject() as RenderBox;

    final position1 = box1.localToGlobal(Offset.zero);
    final position2 = box2.localToGlobal(Offset.zero);
    final position3 = box3.localToGlobal(Offset.zero);
    final position4 = box4.localToGlobal(Offset.zero);
    final position0 = box0.localToGlobal(Offset.zero);

    ref.read(poiListProvider.notifier).state['list'][0]['offset'] = position0;
    ref.read(poiListProvider.notifier).state['list'][1]['offset'] = position1;
    ref.read(poiListProvider.notifier).state['list'][2]['offset'] = position2;
    ref.read(poiListProvider.notifier).state['list'][3]['offset'] = position3;
    ref.read(poiListProvider.notifier).state['list'][4]['offset'] = position4;
  }

  Map<String, dynamic> calculateDistance() {
    Offset xy = const Offset(0, 0);
    double distanceL1 = 0;
    double distanceL2 = 0;
    Offset location1 = ref.read(locationProvider)['location1']['offset'];
    Offset location2 = ref.read(locationProvider)['location2']['offset'];
    for (int i = 0; i < ref.read(poiListProvider)['list'].length; i++) {
      if (ref.read(poiListProvider.notifier).state['list'][i]['selected'] ==
          true) {
        xy = ref.read(poiListProvider.notifier).state['list'][i]['offset'];
      }
    }

    distanceL1 = (location1 - xy).distance;
    distanceL2 = (location2 - xy).distance;

    return {'distanceL1': distanceL1, 'distanceL2': distanceL2};
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> poiList = ref.read(poiListProvider);
    calculateXY(key0, key1, key2, key3, key4);
    calculateDistance();
    print(calculateDistance());
    ref.watch(switchStateProvider);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 110),
      Row(
        children: [
          const SizedBox(
            width: 170,
          ),
          poiPresentation(
              poiList['list'][4]['key'], poiList['list'][4]['selected'], key4),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          const SizedBox(
            width: 250,
          ),
          poiPresentation(
              poiList['list'][3]['key'], poiList['list'][3]['selected'], key3),
        ],
      ),
      const SizedBox(height: 90),
      Row(
        children: [
          const SizedBox(
            width: 220,
          ),
          poiPresentation(
              poiList['list'][2]['key'], poiList['list'][2]['selected'], key2),
          const SizedBox(
            width: 40,
          ),
          poiPresentation(
              poiList['list'][1]['key'], poiList['list'][1]['selected'], key1),
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
            key0,
          ),
        ],
      ),
    ]);
  }
}
