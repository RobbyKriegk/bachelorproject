import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final poiListProvider = StateProvider<Map<String, dynamic>>((ref) {
  return <String, dynamic>{
    'list': [
      {
        'key': 'poi1',
        'value': 'Haupteingang',
        'selected': false,
        'offset': null
      },
      {'key': 'poi2', 'value': 'Empfang', 'selected': false, 'offset': null},
      {
        'key': 'poi3',
        'value': 'Information',
        'selected': false,
        'offset': null
      },
      {'key': 'poi4', 'value': 'Atrium', 'selected': false, 'offset': null},
      {'key': 'poi5', 'value': 'Hörsaal', 'selected': false, 'offset': null}
    ]
  };
});

final switchStateProvider = StateProvider<bool>((ref) {
  return false;
});

final locationProvider = StateProvider<Map<String, dynamic>>((ref) {
  return <String, dynamic>{
    'location1': {'selected': false, 'offset': Offset(0, 0)},
    'location2': {'selected': false, 'offset': Offset(0, 0)}
  };
});
