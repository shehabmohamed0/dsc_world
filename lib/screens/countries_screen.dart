import 'package:flutter/material.dart';
import 'package:dsc_world/widgets/countries_list_view.dart';
import 'package:dsc_world/caster.dart';

class CountriesScreen extends StatefulWidget {
  Map<String, dynamic> json;
  Map<String, dynamic> allDataJson;
  String countriesKey;

  CountriesScreen(
      {@required Map<String, dynamic> json, @required String continentName}) {
    this.allDataJson = json;
    String countriesKey = '$continentName countries';
    this.countriesKey = countriesKey;

    var countries = Caster.Cast<Map<String, dynamic>>(json[countriesKey]);
    this.json = countries;
  }

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  TextEditingController _controller = TextEditingController();
  bool _isSearch;
  Widget appBarTitle = Text('Countries');
  Icon icon = Icon(
    Icons.search,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSearch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(child: appBarTitle),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: icon,
              onPressed: () {
                setState(() {
                  _isSearch = !_isSearch;
                  if (_isSearch) {
                    this.icon = Icon(Icons.close);
                    appBarTitle = TextField(
                        autofocus: true,
                        controller: _controller,
                        cursorColor: Theme.of(context).accentColor,
                        onChanged: (newText) {
                          setState(() {
                            _controller.value = TextEditingValue(text: newText);
                            _controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: _controller.text.length));
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).accentColor,
                          ),
                        ));
                  } else {
                    this.icon = Icon(Icons.search);
                    appBarTitle = Text('Countries');
                    _controller.value = TextEditingValue.empty;
                  }
                });
              },
            ),
          ),
        ],
      ),
      body: CountriesListView(
        callBack: () {
          setState(() {});
        },
        textEditingValue: _controller.value,
        countries: widget.json,
        allDataJson: widget.allDataJson,
      ),
    );
  }
}
