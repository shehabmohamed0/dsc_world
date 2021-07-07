import 'package:flutter/material.dart';
import 'package:dsc_world/screens/countries_screen.dart';
import 'package:provider/provider.dart';
import 'package:dsc_world/provider/json_provider.dart';

class ContinentCard extends StatelessWidget {
  int flex = 1;
  String continentName;
  String continentImage;

  ContinentCard({this.flex, this.continentName, this.continentImage});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> json = Provider.of<JsonProvider>(context).data;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Map<String, dynamic>>(
            builder: (context) => CountriesScreen(
              json: json,
              continentName: continentName,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: MediaQuery.of(context).size.height / 6,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    continentImage,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  continentName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
