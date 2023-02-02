import 'dart:convert' as convert;

import 'package:flutter_bloc_architecture/data/services/model/cards_response.dart';

class GetCardsResponse {
  bool success;
  String deckId;
  List<CardResponse> cards;
  int remaining;

  GetCardsResponse({
    required this.success,
    required this.deckId,
    required this.cards,
    required this.remaining,
  });

  static GetCardsResponse fromJson(String json) {
    var jsonObject = convert.jsonDecode(json) as Map<String, dynamic>;

    List<dynamic> cards = jsonObject["cards"] as List<dynamic>;
    List<CardResponse> cardList = cards.map((cardJson) {
      return CardResponse.fromJson(cardJson);
    }).toList();

    return GetCardsResponse(
      success: jsonObject["success"] as bool,
      deckId: jsonObject["deck_id"] as String,
      cards: cardList,
      remaining: jsonObject["remaining"] as int,
    );
  }
}
