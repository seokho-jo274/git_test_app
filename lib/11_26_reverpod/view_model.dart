import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_26_reverpod/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel extends Notifier<Models> {
  @override
  Models build() {
    return Models(Model(aisOn: false, bisOn: false, cisOn: false));
  }

  void numbers(String name) {
    switch (name) {
      case 'A':
        state = Models(state.isOns.copyWith(aisOn: !state.isOns.aisOn));
        break;
      case 'B':
        state = Models(state.isOns.copyWith(bisOn: !state.isOns.bisOn));
        break;
      case 'C':
        state = Models(state.isOns.copyWith(cisOn: !state.isOns.cisOn));
        break;
    }
  }
}

final viewModelProvider = NotifierProvider<ViewModel, Models>(
  () => ViewModel(),
);
