import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/continents.dart';
import 'provider/theme_provider.dart';
import 'provider/json_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/jsonFiles/finalData.json'),
            builder: (context, snapshot) {
              //DecodeJson
              if (snapshot.hasData) {
                var myData = jsonDecode(snapshot.data);
                return ChangeNotifierProvider(
                  create: (context) {
                    return JsonProvider(myData);
                  },
                  child: Continents(),
                );
              } else {
                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
