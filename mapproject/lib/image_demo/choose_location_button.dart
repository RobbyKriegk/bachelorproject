import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapproject/image_demo/provider.dart';

class ChooseLocationButton extends ConsumerStatefulWidget {
  const ChooseLocationButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseLocationButtonState();
}

class _ChooseLocationButtonState extends ConsumerState<ChooseLocationButton> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        onPressed: () {
          ref.read(switchStateProvider.notifier).state =
              !ref.read(switchStateProvider);

          ref.read(locationProvider.notifier).state['location1']['selected'] =
              true;
          ref.read(locationProvider.notifier).state['location2']['selected'] =
              false;
        },
        child: const Text('Location1'),
      ),
      ElevatedButton(
        onPressed: () {
          ref.read(switchStateProvider.notifier).state =
              !ref.read(switchStateProvider);
          ref.read(locationProvider.notifier).state['location1']['selected'] =
              false;
          ref.read(locationProvider.notifier).state['location2']['selected'] =
              true;
        },
        child: const Text('Location2'),
      ),
    ]);
  }
}
