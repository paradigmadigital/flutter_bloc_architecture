import 'package:flutter_bloc_architecture/domain/entities/hand_entity.dart';

abstract class GetCardsHandUseCaseInterface {

  Future<HandEntity> getCards();
}
