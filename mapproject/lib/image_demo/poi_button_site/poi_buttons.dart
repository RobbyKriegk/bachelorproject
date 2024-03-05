import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapproject/image_demo/provider.dart';

class POIButtons extends ConsumerStatefulWidget {
  const POIButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _POIButtonsState();
}

class _POIButtonsState extends ConsumerState<POIButtons> {
  ElevatedButton poiButton = ElevatedButton(
    onPressed: () {},
    child: const Text('POI Button'),
  );

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> poiList = ref.read(poiListProvider);
    return ListView(
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 100),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
        for (int i = 0; i < poiList['list'].length; i++)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 100),
            ),
            onPressed: () {
              Navigator.pop(context);
              // all selected false
              for (int j = 0; j < poiList['list'].length; j++) {
                ref.read(poiListProvider.notifier).state['list'][j]
                    ['selected'] = false;
              }
              ref.read(poiListProvider.notifier).state['list'][i]['selected'] =
                  true;
              ref.read(switchStateProvider.notifier).state =
                  !ref.read(switchStateProvider);
            },
            child: Text('${poiList['list'][i]['value']}'),
          ),
      ],
    );
  }
}
