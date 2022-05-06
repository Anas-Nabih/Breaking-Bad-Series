import 'package:breaking_bad_series/business_logic/chrachters_cubit.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/presentation/widgets/character_item.dart';
import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
 late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"), backgroundColor: MColors.yellow,centerTitle: true,),
      body: BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context, state){
          if(state is CharactersLoaded){
            allCharacters = state.characters;
            return buildLoadedListWidget();
          }else{
            return Center(child: CircularProgressIndicator(color: MColors.yellow,));
          }
        },
      ),
    );

  }
 buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        color: MColors.grey,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
 }

 buildCharactersList(){
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: allCharacters.length,
      itemBuilder: (context, index) => CharacterItem(character:allCharacters[index],),);
 }
}
