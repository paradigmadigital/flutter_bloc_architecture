import 'package:flutter_bloc_architecture/data/services/cards/cards_service.dart';
import 'package:flutter_bloc_architecture/data/services/model/generate_deck_response.dart';
import 'package:flutter_bloc_architecture/data/services/model/get_cards_response.dart';
import 'package:flutter_bloc_architecture/domain/entities/card_entity.dart';
import 'package:flutter_bloc_architecture/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_architecture/domain/entities/hand_entity.dart';
import 'package:flutter_bloc_architecture/data/repository/cards_repository_interface.dart';

class CardsRepository implements CardsRepositoryInterface {
  CardsService cardsService;

  CardsRepository({required this.cardsService});

  @override
  Future<HandEntity> getCards(DeckEntity deck) async {
    // pedimos las cartas
    GetCardsResponse? cardsResponse = await cardsService.getCardsFromService(deck);
    if (cardsResponse != null) {
      List<CardEntity> cardList = cardsResponse.cards.map((cardToMap) {
        return CardEntity(name: cardToMap.name, urlImage: cardToMap.urlImage);
      }).toList();
      return HandEntity(cardList: cardList, remainingCardsInDeck: cardsResponse.remaining);
    } else {
      return HandEntity(cardList: List<CardEntity>.empty(), remainingCardsInDeck: 0);
    }
  }

  @override
  Future<DeckEntity> generateDeck() async {
    GenerateDeckResponse? deck = await cardsService.generateDeck();
    if(deck != null){
      return DeckEntity(deckId: deck.deckId, remainingCards: deck.remaining);
    }else{
      return DeckEntity(deckId: "", remainingCards: 0);
    }
  }
}
