import 'package:dsc_world/models/country_list_view_model.dart';
import 'package:dsc_world/models/favourite_data.dart';
import 'package:dsc_world/screens/country_detail_screen.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    List<String> favouriteNames = FavouriteData.names.toList();
    List<String> favouriteFlags = FavouriteData.flags.toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            favouriteFlags[index],
            style: (TextStyle(fontSize: 40)),
          ),
          title: Text(
            favouriteNames[index],
            style: TextStyle(fontSize: 18),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.star,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                FavouriteData.names.remove(favouriteNames[index]);
                FavouriteData.flags.remove(favouriteFlags[index]);
                favouriteNames.removeAt(index);
                favouriteFlags.removeAt(index);
              });
            },
          ),
        );
      },
      itemCount: favouriteNames.length,
    );
  }
}
