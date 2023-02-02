part of 'cards_bloc.dart';

abstract class CardsState {}

class LoadingCardsState extends CardsState {}

class GetCardsOKState extends CardsState {
  HandEntity handCards;

  GetCardsOKState({required this.handCards});
}
