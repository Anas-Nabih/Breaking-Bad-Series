 import 'package:breaking_bad_series/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: AppString.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async{
    try{
      Response response = await dio.get(AppString.getCharacters);
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;

    }catch(e){
      if(kDebugMode) print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String characterName) async{
    try{
      // Response response = await dio.get(AppString.getCharacterQuotes(characterName));
      Response response = await dio.get("quote",queryParameters: {"author":characterName});
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;

    }catch(e){
      if(kDebugMode) print(e.toString());
      return [];
    }
  }
}