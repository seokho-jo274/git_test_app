import 'package:flutter_git_test/11_26_reverpod/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel extends Notifier<Model> {
  @override
  Model build() {
    return Model('Alarm');
  }

  void add(String name) {
    switch (name) {
      case 'Add':
        break;
      case 'Remove':
        break;
    }
  }
}

final viewModelProvider = NotifierProvider<ViewModel, Model>(() => ViewModel());
