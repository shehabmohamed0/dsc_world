import 'package:dsc_world/caster.dart';
import 'package:dsc_world/models/favourite_data.dart';
import 'package:dsc_world/screens/country_detail_screen.dart';
import 'package:dsc_world/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:dsc_world/models/country_list_view_model.dart';

class CountriesListView extends StatefulWidget {
  Map<String, dynamic> countries;
  Map<String, dynamic> allDataJson;
  bool _useSearchLists = false;
  TextEditingValue textEditingValue;
  Function callBack;
  List<CountryListViewModel> countryListViewModels = [];

  List<CountryListViewModel> countryListViewSearchModels = [];

  CountriesListView(
      {this.allDataJson,
      this.callBack,
      Map<String, dynamic> countries,
      this.textEditingValue}) {
    this.countries = countries;
    if (textEditingValue == TextEditingValue.empty) {
      _useSearchLists = false;
      countries.forEach((key, value) {
        final String name = value['name'];
        final newModel = CountryListViewModel(
            name: value['name'],
            flag: value['emoji'],
            key: key,
            selected: false);
        if (FavouriteData.names.contains(name)) {
          newModel.setFavourite(true);
        }
        countryListViewModels.add(newModel);
      });
    } else {
      _useSearchLists = true;
      countries.forEach((key, value) {
        if (value['name']
            .toString()
            .toLowerCase()
            .contains(textEditingValue.text.toString())) {
          final String name = value['name'];
          final newModel = CountryListViewModel(
              name: value['name'],
              flag: value['emoji'],
              key: key,
              selected: false);
          if (FavouriteData.names.contains(name)) {
            newModel.setFavourite(true);
          }
          countryListViewSearchModels.add(newModel);
        }
      });
    }
  }

  @override
  _CountriesListViewState createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  @override
  Widget build(BuildContext context) {
    List<CountryListViewModel> usedList = widget._useSearchLists
        ? widget.countryListViewSearchModels
        : widget.countryListViewModels;
    print(usedList[1].selected);
    return ListView.builder(
      itemBuilder: (context, index) {
        String flagIndex = 'flag$index';
        return Container(
          child: ListTile(
            leading: Hero(
              tag: flagIndex,
              child: Text(
                usedList[index].flag,
                style: (TextStyle(fontSize: 40)),
              ),
            ),
            title: Text(
              usedList[index].name,
              style: TextStyle(fontSize: 18),
            ),
            trailing: usedList[index].selected
                ? IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        usedList[index].reverseFavourite();
                        FavouriteData.names.remove(usedList[index].flag);
                        FavouriteData.names.remove(usedList[index].name);
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.star_border,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        usedList[index].reverseFavourite();

                        FavouriteData.names.add(usedList[index].name);
                        FavouriteData.flags.add(usedList[index].flag);
                      });
                    },
                  ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailScreen(
                    allDataJson: widget.allDataJson,
                    countries: widget.countries,
                    key: usedList[index].key,
                    flagIndex: flagIndex,
                  ),
                ),
              );
            },
          ),
        );
      },
      itemCount: usedList.length,
    );
  }
}
