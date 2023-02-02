import 'package:flutter_bloc_architecture/domain/entities/deck_entity.dart';
import 'package:flutter_bloc_architecture/data/repository/deck_local_storage_repository_interface.dart';
import 'package:localstorage/localstorage.dart';

class DeckLocalStorageRepository extends DeckLocalStorageRepositoryInterface {
  static final LocalStorage storage = LocalStorage('deck_local_storage');

  @override
  DeckEntity getLocalDeck() {
    String localDeckId = storage.getItem("local_deck_id") ?? "";
    int localDeckRemainingCards = storage.getItem("local_deck_remaining") ?? 0;
    return DeckEntity(deckId: localDeckId, remainingCards: localDeckRemainingCards);
  }

  @override
  void setLocalDeck(DeckEntity deck) {
    storage.setItem("local_deck_id", deck.deckId);
    storage.setItem("local_deck_remaining", deck.remainingCards);
  }
}
