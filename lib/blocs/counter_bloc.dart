import 'package:test_app/blocs/counter_state.dart';
import 'package:test_app/pages/bloc.dart';

class CounterBloc extends Bloc<CounterState, CounterStateBuilder> {
  CounterBloc() : super(CounterState.initial());
  void increment() {
    updateState((b) => b..counter = b.counter! + 1);
  }
}
