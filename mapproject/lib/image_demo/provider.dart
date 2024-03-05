import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<Map<String, dynamic>> poiListProvider =
    StateProvider<Map<String, dynamic>>((ref) {
  return <String, dynamic>{
    'list': [
      {'key': 'poi1', 'value': 'Haupteingang', 'selected': false},
      {'key': 'poi2', 'value': 'Empfang', 'selected': false},
      {'key': 'poi3', 'value': 'Information', 'selected': false},
      {'key': 'poi4', 'value': 'Atrium', 'selected': false},
      {'key': 'poi5', 'value': 'Hörsaal', 'selected': false}
    ]
  };
});

final StateProvider<bool> switchStateProvider = StateProvider<bool>((ref) {
  return false;
});
