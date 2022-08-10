import 'package:flutter/material.dart';

class SearchAction extends SearchDelegate<String> {
  final paintings = ["Ultraboost", "Adilette", "Superstars", "Carbon"];

  final recentPaintings = [
    "Adidas",
    "Supreme",
    "Nike",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentPaintings : paintings;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.draw),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
