import 'package:bloc/bloc.dart';
import 'package:breaking_bad_series/business_logic/chrachters_state.dart';
import 'package:breaking_bad_series/data/models/CharacterQuotesResponse.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  List<CharacterQuotesResponse> quotes = [];

  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });

    return characters;
  }



 void getCharacterQuotes({required String characterName}) {
    charactersRepository.getCharacterQuotes(characterName: characterName).then((quotes) {
      emit(QuotesLoaded(quotes: quotes,));
     });}
}
