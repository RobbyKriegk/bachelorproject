import 'package:flutter/material.dart';
import 'package:mapproject/image_demo/poi_list.dart';

import 'poi_button_site/poi_button_site.dart';

class ChoosePOIButton extends StatefulWidget {
  const ChoosePOIButton({super.key});

  @override
  State<ChoosePOIButton> createState() => _ChoosePOIButtonState();
}

class _ChoosePOIButtonState extends State<ChoosePOIButton> {
  List<DropdownMenuEntry> dropdownMenuEntries = <DropdownMenuEntry>[
    DropdownMenuEntry(
        label: poiList['list'][0]['value'], value: poiList['list'][0]['key']),
    DropdownMenuEntry(
        label: poiList['list'][1]['value'], value: poiList['list'][1]['key']),
    DropdownMenuEntry(
        label: poiList['list'][2]['value'], value: poiList['list'][2]['key']),
    DropdownMenuEntry(
        label: poiList['list'][3]['value'], value: poiList['list'][3]['key']),
    DropdownMenuEntry(
        label: poiList['list'][4]['value'], value: poiList['list'][4]['key']),
  ];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // navigate to the POI page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const POIButtonSite()));
        },
        child: const Text('Choose POI'));
  }
}
