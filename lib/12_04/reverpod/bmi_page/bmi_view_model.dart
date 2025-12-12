import 'package:flutter_git_test/12_04/reverpod/bmi_page/bmi_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiViewModel extends Notifier<BmiModel> {
  @override
  BmiModel build() {
    return BmiModel(isMale: true, height: 170, weight: 70, result: 1);
  }

  // 남자 == 트루
  void onbutton(bool isMale) {
    if (state.isMale == isMale) return;
    state = state.copyWith(isMale: isMale);
  }

  void newheight(int height) {
    state = state.copyWith(height: height);
  }

  void newweight(int weight) {
    state = state.copyWith(weight: weight);
  }

  String resultText() {
    final newcount = state.result;
    if (newcount >= 35) {
      return "EXTREMELY OBESE";
    } else if (newcount >= 30) {
      return "OBESE";
    } else if (newcount >= 25) {
      return "OVERWEIGHT";
    } else if (newcount >= 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String resultBmi() {
    final newcount = state.result;
    if (newcount >= 35) {
      return " <= 35";
    } else if (newcount >= 30) {
      return "30-35";
    } else if (newcount >= 25) {
      return "25-30";
    } else if (newcount >= 18.5) {
      return "18.5-25";
    } else {
      return "> 18.5";
    }
  }
}

final bimViewProvider = NotifierProvider<BmiViewModel, BmiModel>(
  BmiViewModel.new,
);
