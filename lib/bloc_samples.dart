import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  int counter;

  CounterState({required this.counter});
}

class IncrementEvent {}

class CounterBloc extends Bloc<IncrementEvent, CounterState> {
  CounterState _counterState = CounterState(counter: 0);

  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emmit) {
      _counterState = CounterState(counter: _counterState.counter + 1);
      emit(_counterState);
    });
  }
}

class CounterLessState {
  int counter;

  CounterLessState({required this.counter});
}

class CounterLessBloc extends Bloc<IncrementEvent, CounterLessState> {
  CounterLessState _counterState = CounterLessState(counter: 0);

  CounterLessBloc() : super(CounterLessState(counter: 0)) {
    on<IncrementEvent>((event, emmit) {
      _counterState = CounterLessState(counter: _counterState.counter - 1);
      emit(_counterState);
    });
  }
}

BlocProvider<CounterBloc> buildBlocProvider() {
  return BlocProvider(
    create: (context) => CounterBloc(),
    child: BlocBuilder<CounterBloc, CounterState>(
      builder: (context, counterState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pulsaciones: ${counterState.counter}'),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
              },
              child: const Text("+1"),
            ),
          ],
        );
      },
    ),
  );
}

Widget blockProviderExample() {
  return BlocProvider(
    create: (BuildContext context) => CounterBloc(),
    child: Text("This is a BLoC Provider"),
  );
}

Widget multiBlockProviderExample() {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => CounterBloc()),
      BlocProvider(create: (BuildContext context) => CounterLessBloc()),
    ],
    child: Text("This is a Multi BLoC Provider"),
  );
}

Widget repositoryBlockProviderExample() {
  return RepositoryProvider(
    create: (context) => Repository1(),
    child: BlocProvider(
      create: (BuildContext context) => Bloc1(repository1: context.read<Repository1>()),
      child: Text("This is a repository BLoC Provider"),
    ),
  );
}

Widget multuRepositoryBlockProviderExample() {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => Repository1()),
      RepositoryProvider(create: (context) => Repository2()),
    ],
    child: BlocProvider(
      create: (BuildContext context) => Bloc2(
        repository1: context.read<Repository1>(),
        repository2: context.read<Repository2>(),
      ),
      child: Text("This is a multirepository BLoC Provider"),
    ),
  );
}

class Repository1 {}

class Repository2 {}

class Bloc1 extends Bloc<Event1, State1> {
  Repository1 repository1;

  Bloc1({required this.repository1}) : super(State1());
}

class Bloc2 extends Bloc<Event1, State1> {
  Repository1 repository1;
  Repository2 repository2;

  Bloc2({required this.repository1, required this.repository2}) : super(State1());
}

class Event1 {}

class State1 {}

Widget blocListenerExample() {
  return BlocListener<Bloc1, State1>(listener: (context, state) {
    if (state.runtimeType == State1) {
      //realizar una acción que no esté
      //ligada a nuestro árbol de widgets
      //por ejemplo: mostrar un Toast
      //o un snackbar
    }
  });
}

Widget blockBuilderExample() {
  return BlocBuilder<Bloc1, State1>(builder: (context, state) {
    if (state.runtimeType == State1) {
      return const CircularProgressIndicator();
    } else {
      return const Text("Mostrar datos");
    }
  });
}

Widget blockConsumerExample() {
  return BlocConsumer<Bloc1, State1>(listener: (context, state) {
    if (state.hashCode == 0) {
      context.read<Bloc1>().add(Event1());
    }
  }, builder: (context, state) {
    if (state.runtimeType == State1) {
      return const CircularProgressIndicator();
    } else {
      return const Text("Mostrar datos");
    }
  });
}
