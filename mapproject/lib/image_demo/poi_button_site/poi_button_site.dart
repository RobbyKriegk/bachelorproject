import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapproject/image_demo/poi_button_site/poi_buttons.dart';

class POIButtonSite extends ConsumerStatefulWidget {
  const POIButtonSite({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _POIButtonSiteState();
}

class _POIButtonSiteState extends ConsumerState<POIButtonSite> {
  @override
  Widget build(BuildContext context) {
    return POIButtons();
  }
}
