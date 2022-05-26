import 'package:breaking_bad_series/data/models/CharacterQuotesResponse.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/data/web_services/character_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository({required this.charactersWebServices});

  Future<List<Character>> getAllCharacters()async{
    final characters =  await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

  Future<List<CharacterQuotesResponse>> getCharacterQuotes({required String characterName})async{
    final quotes =  await charactersWebServices.getCharacterQuotes(characterName);
    return quotes.map((quote) => CharacterQuotesResponse.fromJson(quote)).toList();
  }
}