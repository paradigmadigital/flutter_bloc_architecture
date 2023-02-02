import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/presentation/pages/cards/cards_page.dart';
import 'package:flutter_bloc_architecture/utils/resources.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const route = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Resources.textToolbarTitle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Resources.iconPocker,
              width: MediaQuery.of(context).size.width / 2,
            ),
            ElevatedButton(
              onPressed: () {
                //Navigate to Screen 2
                context.go("/${CardsPage.route}");
              },
              child: const Text(Resources.textLetsPlay),
            )
          ],
        ),
      ),
    );
  }
}
