import 'package:flutter_bloc_architecture/domain/entities/card_entity.dart';

class HandEntity {
  List<CardEntity> cardList;
  int remainingCardsInDeck;

  HandEntity({required this.cardList, required this.remainingCardsInDeck});
}
