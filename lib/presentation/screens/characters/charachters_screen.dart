import 'package:breaking_bad_series/business_logic/chrachters_cubit.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/presentation/widgets/no_data_found.dart';
import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/characters_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  List<Character> searchedList = [];
  bool _isSearched = false;
  final _searchedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  void addToSearchedList(String searchedCharacter){
    searchedList = allCharacters.where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.grey,
      appBar: AppBar(
        title: _isSearched ? buildSearchedList(): Text("Characters"),
        leading: _isSearched ? BackButton(color: MColors.grey,):Container() ,
        actions: [buildAppBarActions()],
        backgroundColor: MColors.yellow,
        centerTitle: true,
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return _searchedController.text.isNotEmpty && searchedList.isEmpty ?
            NoDataFound():CharactersList(
              allCharacters: allCharacters,
              searchedList:searchedList,
              controller: _searchedController,
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: MColors.yellow,
            ));
          }
        },
      ),
    );
  }

  buildSearchedList(){
    return TextField(
      controller: _searchedController,
      cursorColor: MColors.grey,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search for character...",
        hintStyle: TextStyle(color: MColors.grey,fontSize: 18)
      ),
      style: TextStyle(color: MColors.grey,fontSize: 18),
      onChanged: (searchedCharacter){
        addToSearchedList(searchedCharacter);
      },
    );
  }

  buildAppBarActions(){
    if(_isSearched){
      return IconButton(onPressed: (){
        _clearSearch();
        Navigator.pop(context);
      }, icon: Icon(Icons.clear,color: MColors.grey,));
    }else{
      return IconButton(onPressed: _startSearch, icon: Icon(Icons.search,color: MColors.grey,));

    }
  }
 void _startSearch(){
    ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      _isSearched = true;
    });
 }

 void stopSearching(){
    _clearSearch();
    setState(() {
      _isSearched = false;
    });
 }

 _clearSearch(){
   _searchedController.clear();setState(() {

   });
 }
}
