class CharacterQuotesResponse {
  int? quoteId;
  String? quote;
  String? author;
  String? series;

  CharacterQuotesResponse({this.quoteId, this.quote, this.author, this.series});

  CharacterQuotesResponse.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['quote_id'] = quoteId;
    data['quote'] = quote;
    data['author'] = author;
    data['series'] = series;
    return data;
  }
}