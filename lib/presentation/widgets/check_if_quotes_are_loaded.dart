

  import 'package:breaking_bad_series/business_logic/chrachters_state.dart';
import 'package:flutter/material.dart';

checkIfQuotesAreLoaded({required CharactersState state}){
  if(state is QuotesLoaded){
    return displayRandomQuoteOrEmptySpace(state: state);
  }else{
    return CircularProgressIndicator();
  }
}

displayRandomQuoteOrEmptySpace({required CharactersState state}){
  // var quotes = (state).QuotesLoaded;
  return Container();
}