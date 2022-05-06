 import 'package:breaking_bad_series/business_logic/chrachters_cubit.dart';
import 'package:breaking_bad_series/data/repository/characters_repository.dart';
import 'package:breaking_bad_series/data/web_services/character_web_services.dart';
import 'package:breaking_bad_series/presentation/screens/characters/charachters_screen.dart';
import 'package:breaking_bad_series/presentation/screens/characters_details/characters_details.dart';
import 'package:breaking_bad_series/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter{
 late CharactersRepository charactersRepository;
 late CharactersCubit charactersCubit;

 AppRouter(){
   charactersRepository = CharactersRepository(charactersWebServices: CharactersWebServices());
   charactersCubit = CharactersCubit(charactersRepository: charactersRepository);
 }


    MaterialPageRoute generateRouter(RouteSettings settings){
    switch(settings.name){
      case AppString.charactersScreen:
        return MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
          create: (context) => charactersCubit,
        child: CharactersScreen(),) );

        case AppString.characterScreenDetails:
        return MaterialPageRoute(builder: (_) => CharacterDetails());

      default:
        return MaterialPageRoute(builder: (context) => CharacterDetails(),);

    }
  }
}