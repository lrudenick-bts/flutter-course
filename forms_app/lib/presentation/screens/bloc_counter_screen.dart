import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _increseCounterBy(BuildContext context, {int value = 1}) {
    context.read<CounterBloc>().add(CounterIncreassed(value: value));
  }

  void _resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(const CounterReset());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc value) {
          return Text('Bloc counter ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () => _resetCounter(context), 
              icon: const Icon(Icons.refresh_rounded)
            )
        ],
      ),
      body: Center(child: context.select((CounterBloc value) {
        return Text('Counter value: ${value.state.counter}');
      })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => _increseCounterBy(context, value: 3),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => _increseCounterBy(context, value: 2),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => _increseCounterBy(context),
          )
        ],
      ),
    );
  }
}
