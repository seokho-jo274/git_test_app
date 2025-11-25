import 'package:flutter_git_test/11_26_reverpod/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel extends Notifier<Model> {
  @override
  //초기값
  Model build() {
    return Model(0);
  }

  void numbers(String type) {
    var numberValue = state.count; // 👈
    var newnumber = numberValue;
    switch (type) {
      case 'add':
        newnumber++;

        break;
      case 'remove':
        newnumber--;
        break;
      case 'riset':
        newnumber = 0;
        break;
    }
    state = state.copyWith(count: newnumber);
  }
}

final homeprovider = NotifierProvider<ViewModel, Model>(() => ViewModel());
