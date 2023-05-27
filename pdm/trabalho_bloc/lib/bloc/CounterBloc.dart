import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield* _increment(event);
    } else if (event is DecrementEvent) {
      yield* _decrementEvent(event);
    }
  }

  Stream<CounterState> _increment(IncrementEvent event) async* {
    yield ButtonClicked(event.counter + 1);
  }

  Stream<CounterState> _decrementEvent(DecrementEvent event) async* {
    yield ButtonClicked(event.counter - 1);
  }
}

abstract class CounterEvent extends Equatable {}

class IncrementEvent extends CounterEvent {
  final int counter;
  IncrementEvent(this.counter);

  @override
  List<Object?> get props => [counter];
}

class DecrementEvent extends CounterEvent {
  final int counter;
  DecrementEvent(this.counter);

  @override
  List<Object?> get props => [counter];
}

abstract class CounterState extends Equatable {}

class ButtonClicked extends CounterState {
  final int counter;
  ButtonClicked(this.counter);

  @override
  List<Object?> get props => [counter];
}

class InitialState extends CounterState {
  final int initialValue;
  InitialState(this.initialValue);
  @override
  List<Object?> get props => [initialValue];
}
