import 'package:flutter_git_test/12-01/test_test/tast_count_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TastaViewModel extends Notifier<TastaModel> {
  @override
  TastaModel build() {
    return TastaModel(0);
  }

  void button(String type) {
    var total = state.count;
    switch (type) {
      case '증가':
        total++;
        break;
      case '감소':
        total--;
        break;
      case '곱하기':
        total *= 2;
        break;
      case '초기화':
        total = 0;
        break;
    }
    state = state.copyWith(state.count = total);
  }
}

final tastaProvider = NotifierProvider<TastaViewModel, TastaModel>(
  TastaViewModel.new,
);
