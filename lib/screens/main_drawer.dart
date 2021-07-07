import 'package:flutter/material.dart';
import 'package:dsc_world/widgets/change_theme_button_widget.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/shehab.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Shehab Mohamed',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'shehabmohamed415@gmail.com',
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Dark Mode",
              style: TextStyle(fontSize: 18),
            ),
            trailing: ChangeThemeButtonWidget(),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
