import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/domain/entities/hand_entity.dart';
import 'package:flutter_bloc_architecture/domain/useCase/get_cards_hand_use_case_interface.dart';

part 'cads_event.dart';

part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  GetCardsHandUseCaseInterface getCardsHandUseCase;

  CardsBloc({required this.getCardsHandUseCase}) : super(LoadingCardsState()) {
    on<LoadingCardsEvent>((event, emmit) {
      getCards();
    });
  }

  void getCards() async {
    HandEntity handCards = await getCardsHandUseCase.getCards();
    emit(GetCardsOKState(handCards: handCards));
  }
}
