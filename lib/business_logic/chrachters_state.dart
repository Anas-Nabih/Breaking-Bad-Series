import 'package:breaking_bad_series/data/models/CharacterQuotesResponse.dart';
import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded({required this.characters});
}

class QuotesLoaded extends CharactersState {
  final List<CharacterQuotesResponse> quotes;
  QuotesLoaded({required this.quotes});
}
