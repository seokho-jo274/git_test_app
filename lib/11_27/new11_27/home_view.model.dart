import 'package:flutter_git_test/11_27/new11_27/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<HomeModel> {
  @override
  HomeModel build() {
    return HomeModel(
      number1: 43,
      number2: 41,
      total: 0,
      duty: 6,
      countA: 0,
      countB: 0,
    );
  }

  void bottons(String type, String action) {
    int newcountA = state.countA;
    int newcountB = state.countB;
    switch (type) {
      case 'A':
        if (action == '더하기') {
          newcountA++;
        } else if (action == '빼기') {
          newcountA--;
        }
        break;
      case 'B':
        if (action == '더하기') {
          newcountB++;
        } else if (action == '빼기') {
          newcountB--;
        }
        break;
    }
    state = state.copyWith(countA: newcountA);
    state = state.copyWith(countB: newcountB);
  }
}

// 종류
void title(String number) {
  switch (number) {
    case 'queen':
      break;
    case 'shirt':
      break;
    default:
      '에러';
      break;
  }
}

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
      break;
  }
}

//이름
void names(String name) {
  switch (name) {
    case 'queen':
      'Ctton queen T';
      break;
    case 'shirt':
      'Greg T-shirt';
      break;
    default:
      '에러';
      break;
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
      break;
  }
}

final homeprovider = NotifierProvider<HomeViewModel, HomeModel>(
  HomeViewModel.new,
);
