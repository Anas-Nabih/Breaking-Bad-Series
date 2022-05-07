import 'package:flutter/material.dart';

import '../../data/models/CharacterResponse.dart';
import 'character_item.dart';

class CharactersList extends StatelessWidget {
  final List<Character> allCharacters;
  final List<Character> searchedList;
  final TextEditingController controller;

  const CharactersList({Key? key, required this.allCharacters,required this.searchedList, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      itemCount: controller.text.isEmpty ? allCharacters.length : searchedList.length,
      itemBuilder: (context, index) => CharacterItem(character:controller.text.isEmpty ? allCharacters[index] : searchedList[index],),);
  }
}
