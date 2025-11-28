import 'package:flutter_git_test/11_27/total/total_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalViewModel extends Notifier<TotalModel> {
  @override
  TotalModel build() {
    return TotalModel(greg: 41, queen: 43, duty: 6, price: 0);
  }

  void totals(String total) {}
}

final totalProvider = NotifierProvider<TotalViewModel, TotalModel>(
  () => TotalViewModel(),
);
