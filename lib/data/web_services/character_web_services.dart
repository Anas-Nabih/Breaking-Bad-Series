import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
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
      Response response = await dio.get('characters');
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