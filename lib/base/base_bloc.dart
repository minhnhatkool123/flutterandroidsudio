import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterandroidsudio/base/base_event.dart';

abstract class basebloc {
  StreamController<base_event> _eventstreamcontroller =
      StreamController<base_event>();

  Sink<base_event> get event => _eventstreamcontroller.sink;

  basebloc() {
    _eventstreamcontroller.stream.listen((event) {
      if (event is! base_event) {
        throw Exception("Event khong hop le");
      }

      dispathevent(event);
    });
  }
  void dispathevent(base_event event);
  @mustCallSuper
  void dispose() {
    _eventstreamcontroller.close();
  }
}
