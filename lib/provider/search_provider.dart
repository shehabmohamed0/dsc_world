import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingValue value;
  SearchProvider({@required this.value});

  void setNewText(TextEditingValue newText) {
    value = newText;
    notifyListeners();
  }
}
