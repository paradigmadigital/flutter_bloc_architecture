import 'package:flutter_bloc_architecture/domain/entities/deck_entity.dart';

abstract class DeckLocalStorageRepositoryInterface {
  DeckEntity getLocalDeck();

  void setLocalDeck(DeckEntity deck);
}
