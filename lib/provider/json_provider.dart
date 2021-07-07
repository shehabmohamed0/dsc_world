import 'package:flutter/foundation.dart';

class JsonProvider extends ChangeNotifier {
  Map<String, dynamic> data;

  JsonProvider(Map<String, dynamic> data) {
    this.data = data;
  }
}
