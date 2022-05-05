 import 'package:breaking_bad_series/presentation/screens/characters/charachters_screen.dart';
import 'package:breaking_bad_series/presentation/screens/characters_details/characters_details.dart';
import 'package:breaking_bad_series/res/strings.dart';
import 'package:flutter/material.dart';
class AppRouter{
    MaterialPageRoute generateRouter(RouteSettings settings){
    switch(settings.name){
      case AppString.charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());

        case AppString.characterScreenDetails:
        return MaterialPageRoute(builder: (_) => CharacterDetails());

      default:
        return MaterialPageRoute(builder: (context) => CharacterDetails(),);

    }
  }
}