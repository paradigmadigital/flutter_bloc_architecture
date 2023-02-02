import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_architecture/domain/entities/card_entity.dart';

class CardsHandWidget extends StatefulWidget {
  const CardsHandWidget({Key? key, required this.cards, required this.height}) : super(key: key);

  final List<CardEntity> cards;
  final int _degreesBetweenCards = 12;
  final double height;

  @override
  State<CardsHandWidget> createState() => _CardsHandWidgetState();
}

class _CardsHandWidgetState extends State<CardsHandWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: widget.cards.asMap().entries.map((entry) {
          int cardIndex = entry.key;
          CardEntity card = entry.value;
          return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: (-25 + (cardIndex * widget._degreesBetweenCards)) * math.pi / 180,
              child: Transform.translate(
                offset: const Offset(0, -220),
                child: Image.network(card.urlImage, height: 200),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
