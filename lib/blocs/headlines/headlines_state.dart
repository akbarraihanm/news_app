import 'package:flutter/material.dart';

abstract class HeadlinesState {
  void when({
    Function(String message)? onError,
    Function(String message)? onUnauthorized,
  }) {
    final state = this;
    if (state is ErrorHeadlines) {
      onError?.call(state.message);
    } else if (state is UnauthorizedHeadlines) {
      onUnauthorized?.call(state.message);
    }
  }

  Widget buildWhen({
    required Widget onInit,
    Widget? onLoading,
  }) {
    if (this is LoadingHeadlines) return onLoading ?? onInit;
    return onInit;
  }
}

class InitHeadlines extends HeadlinesState {}

class LoadingHeadlines extends HeadlinesState {}

class ErrorHeadlines extends HeadlinesState {
  String message;

  ErrorHeadlines(this.message);
}

class UnauthorizedHeadlines extends HeadlinesState {
  String message;

  UnauthorizedHeadlines(this.message);
}
