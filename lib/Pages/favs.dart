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
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var fav in appState.favorites)
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border(bottom: BorderSide(color: Color(0xFFFFFFFF)))),
            child: ListTile(
              leading: Icon(Icons.done),
              title: Text(fav.toString()),
              onTap: () => appState.removeFromFav(fav),
            ),
          )
      ],
    );
  }
}
