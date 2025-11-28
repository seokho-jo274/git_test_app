import 'package:flutter_git_test/new11_27/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<HomeModel> {
  @override
  HomeModel build() {
    return HomeModel(number1: 43, number2: 41, total: 0, duty: 6, count: 0);
  }

  void bottons(String plus, total) {
    int newcount = state.count;
    switch (plus) {
      case '더하기':
        newcount++;
        break;
      case '뺴기':
        newcount--;
        break;
      default:
        -1;
    }

    double newtodel = state.total;
    switch (total) {
      case '증가':
        newtodel = state.number1.toDouble() * newcount.toDouble();
        break;
      case '감소':
        newtodel = state.number2.toDouble() * newcount.toDouble();
        break;
      default:
        -1;
    }
    state = state.copyWith(total: newtodel);

    state = state.copyWith(count: newcount);
  }

  // 변해야하는것
  // 종류

  // 가격
  // void totals(String total) {
  //   var newtodel = state.total.toInt();
  //   switch (total) {
  //     case 'queen':
  //       newtodel = state.number1 * state.count;
  //       break;
  //     case 'shirt':
  //       newtodel = state.number2 * state.count;
  //       break;
  //     default:
  //       0;
  //   }
  //   state = state.copyWith(total: newtodel.toDouble());
  // }
  // 세금
  // 총가격
  //
  // 달라지는것

  //이미지
  void images(String image) {
    switch (image) {
      case 'imagenaumber1': // 케이스 랑 달라도 되나
        'https://picsum.photos/100/100';
        break;
      case 'imagenaumber2':
        'https://picsum.photos/101/101';
        break;
      default:
        '에러';
    }
  }

  //이름
  void names(String name) {
    switch (name) {
      case 'namenumber1':
        'Ctton queen T';
        break;
      case 'namenumber2':
        'Greg T-shirt';
        break;
      default:
        '에러';
    }
  }

  //사이즈
  void sizes(String size) {
    switch (size) {
      case 'S':
        break;
      case 'M':
        break;
      default:
        '에러';
    }
  }

  //토탈

  //총가격 ?
}

final homeprovider = NotifierProvider<HomeViewModel, HomeModel>(
  HomeViewModel.new,
);
