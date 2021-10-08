// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CounterState extends CounterState {
  @override
  final int counter;

  factory _$CounterState([void Function(CounterStateBuilder)? updates]) =>
      (new CounterStateBuilder()..update(updates)).build();

  _$CounterState._({required this.counter}) : super._() {
    BuiltValueNullFieldError.checkNotNull(counter, 'CounterState', 'counter');
  }

  @override
  CounterState rebuild(void Function(CounterStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterStateBuilder toBuilder() => new CounterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CounterState && counter == other.counter;
  }

  @override
  int get hashCode {
    return $jf($jc(0, counter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CounterState')
          ..add('counter', counter))
        .toString();
  }
}

class CounterStateBuilder
    implements Builder<CounterState, CounterStateBuilder> {
  _$CounterState? _$v;

  int? _counter;
  int? get counter => _$this._counter;
  set counter(int? counter) => _$this._counter = counter;

  CounterStateBuilder();

  CounterStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _counter = $v.counter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CounterState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CounterState;
  }

  @override
  void update(void Function(CounterStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CounterState build() {
    final _$result = _$v ??
        new _$CounterState._(
            counter: BuiltValueNullFieldError.checkNotNull(
                counter, 'CounterState', 'counter'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
