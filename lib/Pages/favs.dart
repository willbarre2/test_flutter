import 'package:flutter/material.dart';
import 'package:my_flutter_test/main.dart';
import 'package:provider/provider.dart';

class Favs extends StatelessWidget {
  const Favs({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(
          'No favorites yet.',
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'You have '
            '${appState.favorites.length} favorites:',
          ),
        ),
        for (var fav in appState.favorites)
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(69, 255, 255, 255),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: ListTile(
              leading: Icon(
                Icons.done,
                color: Colors.white,
              ),
              title: Text(fav.toString()),
              onTap: () => appState.removeFromFav(fav),
            ),
          )
      ],
    );
  }
}
