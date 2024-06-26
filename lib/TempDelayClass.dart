import 'package:flutter/material.dart';
import 'dart:async';

// ignore: camel_case_types
class tempDelay {
  final int mill;

  VoidCallback action;
  Timer _timer;

  tempDelay({this.mill});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: mill), action);
  }
}
