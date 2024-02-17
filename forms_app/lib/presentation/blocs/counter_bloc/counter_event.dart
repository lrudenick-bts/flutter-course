part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreassed extends CounterEvent {
  final int value;

  const CounterIncreassed({required this.value});
}

class CounterReset extends CounterEvent {

  const CounterReset();
}
