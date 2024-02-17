import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => counterCubit.reset(), 
            icon: const Icon(Icons.refresh_rounded)
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
        // child: Text('Counter value: ${counterState.counter}'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => counterCubit.increaseBy(3),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => counterCubit.increaseBy(2),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => counterCubit.increaseBy(1),
          )
        ],
      ),
    );
  }
}
