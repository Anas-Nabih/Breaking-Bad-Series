import 'package:bloc/bloc.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'chrachters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit({required this.charactersRepository}) : super(CharactersInitial());

 List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    } );

    return characters;
  }
}
