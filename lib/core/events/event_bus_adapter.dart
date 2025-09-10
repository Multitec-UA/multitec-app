import 'dart:async';
import 'package:event_bus/event_bus.dart' as pkg;

abstract class EventBus {
  void emit<T>(T event);
  Stream<T> listen<T>();
  void dispose();
}

class EventBusImpl implements EventBus {
  EventBusImpl() : _eventBus = pkg.EventBus();

  final pkg.EventBus _eventBus;

  @override
  void emit<T>(T event) {
    _eventBus.fire(event);
  }

  @override
  Stream<T> listen<T>() {
    return _eventBus.on<T>();
  }

  @override
  void dispose() {
    _eventBus.destroy();
  }
}
