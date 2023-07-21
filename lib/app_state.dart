import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _messageReaction = false;
  bool get messageReaction => _messageReaction;
  set messageReaction(bool _value) {
    _messageReaction = _value;
  }

  String _messageFocusText = '';
  String get messageFocusText => _messageFocusText;
  set messageFocusText(String _value) {
    _messageFocusText = _value;
  }

  bool _messageFocusColor = false;
  bool get messageFocusColor => _messageFocusColor;
  set messageFocusColor(bool _value) {
    _messageFocusColor = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
