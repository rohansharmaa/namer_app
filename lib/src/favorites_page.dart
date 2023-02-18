import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No favorites yet."),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${appState.favorites.length} favorites set."),
        ),
        Expanded(
            child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400, childAspectRatio: 400 / 80),
          children: [
            for (var pair in appState.favorites)
              ListTile(
                  leading: ElevatedButton.icon(
                      onPressed: () {
                        appState.deleteWord(pair);
                      },
                      icon: Icon(Icons.delete),
                      label: Text(
                        pair.asLowerCase,
                        semanticsLabel: pair.asPascalCase,
                      ))),
          ],
        ))
      ],
    );
  }
}
