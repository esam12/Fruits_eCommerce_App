import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      log('${bloc.runtimeType} $transition');
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log('${bloc.runtimeType} created');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log('${bloc.runtimeType} closed');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      log('${bloc.runtimeType} $error');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      log('${bloc.runtimeType} $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log('${bloc.runtimeType} $change');
    }
  }
}
