import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_bloc/bloc/CounterBloc.dart';

void main() {
  runApp(BlocProvider(
    create: ((context) => CounterBloc()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'PDM Exemplo BloC'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  int counter = 0;

  MyHomePage({super.key, required this.title});

  var _scaffold;
  @override
  Widget build(BuildContext context) {
    _scaffold = ScaffoldMessenger.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            // _listener(context, state);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Total de clicks:',
                  ),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: BlocListener<CounterBloc, CounterState>(
          listener: _listener,
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementEvent(counter));
                  _scaffold.showSnackBar(
                    const SnackBar(
                      content: Text('Decrementando'),
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 50),
                    ),
                  );
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementEvent(counter));
                  _scaffold.showSnackBar(
                    const SnackBar(
                      content: Text('Incrementando'),
                      backgroundColor: Colors.blue,
                      duration: Duration(milliseconds: 50),
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ));
  }

  void _listener(BuildContext context, CounterState state) {
    if (state is InitialState) {
      Future.delayed(const Duration(seconds: 3), () {
        _scaffold.showSnackBar(
          const SnackBar(
            content: Text('A app BloC foi montada!'),
          ),
        );
      });
      counter = state.initialValue;
    }
    if (state is ButtonClicked) {
      counter = state.counter;
      debugPrint('Clicou e agora são $counter');
    }
  }
}
