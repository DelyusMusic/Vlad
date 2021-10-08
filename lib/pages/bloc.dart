import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:rxdart/rxdart.dart';
// класс блока, сохраняет состояние
abstract class Bloc<TState extends Built<TState, TStateBuilder>,
    TStateBuilder extends Builder<TState, TStateBuilder>> {
      // переменная для измененных состояний
  final _stateSubject = BehaviorSubject<TState>();
  final _subscriptions = CompositeSubscription();

  final TState _initialState;
  // Поток состояний
  Stream<TState> get stateStream => _stateSubject.stream;
  
  TState get state => _stateSubject.value;
  CompositeSubscription get subscriptions => _subscriptions;
  TState get initialState => _initialState;


  final bool debug;

  Bloc(this._initialState, {this.debug = false}) {
    addState(_initialState);

    init();
  }

  Future<void> init() {
    return Future.value();
  }

  void dispose() {
    _subscriptions.dispose();
  }

  void addState(TState state) {
    _stateSubject.add(state);
  }

  void updateState(Function(TStateBuilder b) updates) {
    if (debug) {
    }

    addState(state.rebuild(updates));
    if (debug) {
    }
  }

  StreamSubscription addSubscription(StreamSubscription streamSubscription) {
    return _subscriptions.add(streamSubscription);
  }
}