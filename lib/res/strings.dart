class AppString{
  static final String baseUrl = "https://www.breakingbadapi.com/api/";
  static const String getCharacters = "characters";
  static String getCharacterQuotes(String characterName) => "quote?author=$characterName";

  static const charactersScreen = "/";
  static const characterScreenDetails = "CharacterScreenDetails";
}