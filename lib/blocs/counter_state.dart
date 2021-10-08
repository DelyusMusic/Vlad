import 'package:built_value/built_value.dart';
part 'counter_state.g.dart';

abstract class CounterState implements Built<CounterState, CounterStateBuilder> {
  factory CounterState([void Function(CounterStateBuilder)? updates]) = _$CounterState;

  // BuiltList<Widget> get dialogs;
  int get counter;
  CounterState._();

  static CounterState initial() {
    return CounterState((b) => b..counter=0);
  }
}
