import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/di/dependency_injection.dart';
import 'package:flutter_bloc_architecture/domain/entities/card_entity.dart';
import 'package:flutter_bloc_architecture/domain/useCase/impl/get_cards_hand_use_case.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/cards/cards_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/pages/cards/cards_hand_widget.dart';
import 'package:flutter_bloc_architecture/utils/resources.dart';

class CardsPage extends StatefulWidget {
  static const route = "cards";

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> with TickerProviderStateMixin {
  List<CardEntity> cards = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Resources.textToolbarTitle),
      ),
      body: BlocProvider(
        create: (context) {
          return CardsBloc(getCardsHandUseCase: appInjector.get<GetCardsHandUseCase>());
        },
        child: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case LoadingCardsState:
                {
                  context.read<CardsBloc>().add(LoadingCardsEvent());
                  return const Center(child: CircularProgressIndicator());
                }
              case GetCardsOKState:
                {
                  return Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Swipe refresh para obtener más cartas")],
                      ),
                      RefreshIndicator(
                        onRefresh: () async {
                          context.read<CardsBloc>().emit(LoadingCardsState());
                        },
                        child: ListView(children: [
                          CardsHandWidget(
                            height: 600,
                            cards: (state as GetCardsOKState).handCards.cardList,
                          ),
                        ]),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Text("Cartas restantes: ${(state as GetCardsOKState).handCards.remainingCardsInDeck}"),
                      )
                    ],
                  );
                }
              default:
                {
                  return const SizedBox();
                }
            }
          },
        ),
      ),
      // CardsHandWidget(
      //   cards: cards,
      // ),
    );
  }
}
