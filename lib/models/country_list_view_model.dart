import 'package:flutter/cupertino.dart';

class CountryListViewModel {
  String name;
  String flag;
  String key;
  bool selected = false;
  CountryListViewModel(
      {@required this.name,
      @required this.flag,
      @required this.key,
      this.selected});
  void reverseFavourite() {
    selected = !selected;
  }

  void setFavourite(bool val) {
    selected = val;
  }
}
