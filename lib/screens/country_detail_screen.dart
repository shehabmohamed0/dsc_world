import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  Map<String, dynamic> country;
  Map<String, dynamic> allDataJson;
  String flagIndex;

  CountryDetailScreen(
      {this.allDataJson,
      Map<String, dynamic> countries,
      String key,
      this.flagIndex}) {
    this.country = countries[key];
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).accentColor,
      fontSize: 22,
    );
    final TextStyle _textStyle2 =
        TextStyle(fontSize: 18, color: Theme.of(context).hintColor);
    Widget returnDetail(String detail, String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              detail,
              style: _textStyle,
            ),
            Text(
              text,
              style: _textStyle2,
            )
          ],
        ),
      );
    }

    Widget returnLanguageDetail(List languageKeys) {
      List<String> languageList = [];
      List<String> nativeList = [];

      languageKeys.forEach((element) {
        languageList.add(allDataJson['languages'][element]['name']);
        nativeList.add(allDataJson['languages'][element]['native']);
      });
      return GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5),
          itemCount: languageList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(languageList[index] ?? ""),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).hintColor.withOpacity(0.5)),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(nativeList[index]),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Theme.of(context).hintColor.withOpacity(0.5)),
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(country['name']),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                      width: 1, color: Theme.of(context).accentColor)),
              padding: EdgeInsets.all(20),
              child: Hero(
                tag: flagIndex,
                child: Text(
                  country['emoji'],
                  style: TextStyle(fontSize: 150),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: 1,
            child: Divider(
              thickness: 2,
              color: Theme.of(context).accentColor,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                returnDetail('Name', country['name']),
                returnDetail('Native', country['native']),
                returnDetail('Phone', country['phone']),
                returnDetail('capital', country['capital']),
                returnDetail('Currency', country['currency']),
                Text(
                  "Languages and native writing",
                  style: _textStyle,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: returnLanguageDetail(country['languages']))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
