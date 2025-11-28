import 'package:flutter_git_test/11_27/item/botton/botton_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottonViewModel extends Notifier<BottonModel> {
  @override
  BottonModel build() {
    return BottonModel(count: 0);
  }

  // void image(String total) {
  //   var newtotal = state.count;
  //   switch (total) {
  //     case 'queen':
  //       newtotal = state.count * state.number43;
  //       break;
  //     case 'shirt':
  //       newtotal *= state.number41;
  //       break;
  //   }
  //   state = state.copyWith(top: newtotal.toDouble());
  // }

  void number(String plus) {
    var newcount = state.count;
    switch (plus) {
      case '더하기':
        newcount++;
        break;
      case '뺴기':
        newcount--;
        break;
    }
    state = state.copyWith(count: newcount);
  }
}

final bottonProvider = NotifierProvider<BottonViewModel, BottonModel>(
  BottonViewModel.new,
);
