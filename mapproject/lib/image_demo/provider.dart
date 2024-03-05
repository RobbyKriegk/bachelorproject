import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<Map<String, dynamic>> poiListProvider =
    StateProvider<Map<String, dynamic>>((ref) {
  return <String, dynamic>{
    'list': [
      {'key': 'poi1', 'value': 'Haupteingang'},
      {'key': 'poi2', 'value': 'Empfang'},
      {'key': 'poi3', 'value': 'Information'},
      {'key': 'poi4', 'value': 'Atrium'},
      {'key': 'poi5', 'value': 'Hörsaal'}
    ]
  };
});
