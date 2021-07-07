import 'package:dsc_world/main.dart';
import 'package:dsc_world/provider/json_provider.dart';
import 'package:dsc_world/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsc_world/widgets/continent_card.dart';
import 'package:provider/provider.dart';

class ContinentsScreen extends StatelessWidget {
  final double mainMargin = 0;
  final double crossMargin = 15;
  List<String> continentsAssets = [
    'assets/continents/africa.png',
    'assets/continents/antarctica.png',
    'assets/continents/asia.png',
    'assets/continents/europe.png',
    'assets/continents/north_america.png',
    'assets/continents/oceania.png',
    'assets/continents/south_america_dark.png'
  ];
  List<String> darkContinentsAssets = [
    'assets/darkContinents/africa.png',
    'assets/darkContinents/antarctica.png',
    'assets/darkContinents/asia.png',
    'assets/darkContinents/europe.png',
    'assets/darkContinents/north_america.png',
    'assets/darkContinents/oceania.png',
    'assets/darkContinents/south_america_dark.png'
  ];
  List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    selectedList =
        themeProvider.isDarkMode ? darkContinentsAssets : continentsAssets;
    return Consumer<JsonProvider>(builder: (context, value, child) {
      var json = value.data['continents'];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinentCard(
                continentName: json["AF"],
                continentImage: selectedList[0],
              ),
              ContinentCard(
                continentName: json["AN"],
                continentImage: selectedList[1],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinentCard(
                continentName: json["AS"],
                continentImage: selectedList[2],
              ),
              ContinentCard(
                continentName: json["EU"],
                continentImage: selectedList[3],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinentCard(
                continentName: json["NA"],
                continentImage: selectedList[4],
              ),
              ContinentCard(
                continentName: json["OC"],
                continentImage: selectedList[5],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinentCard(
                continentName: json["SA"],
                continentImage: selectedList[6],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
              )
            ],
          )
        ],
      );
    });
  }
}
