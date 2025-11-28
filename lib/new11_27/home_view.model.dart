import 'package:flutter_git_test/new11_27/home_model.dart';
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

  // plus Strig int  ints
  void bottons(String type, String action) {
    // 1개의 버튼에 2개 의 + -  버튼 에 //  2개의 카운터
    // 더 하기 빼기 를 가져 왔어 2개 값으로 나눠야지 String

    // if ( plus == state.countA ? 'countA' : 'countB') {
    int newcountA = state.countA;
    int newcountB = state.countB;
    switch (type) {
      case 'A':
        if (action == '더하기') {
          newcountA++;
        } else if (action == '빼기') {
          newcountA--;
        }

        // action == '더하기' ? newcountA++ : newcountA--;
        break;
      case 'B':
        if (action == '더하기') {
          newcountB++;
        } else if (action == '빼기') {
          newcountB--;
        }
        break;
      // view => title 2개늘리고 => 버튼 하나를 2개로 더하고 뺀다

      // case '더하기': // 난 더하겠어
      //   // 뭘
      //   ints = newcountA == newcountA ? newcountA++ : newcountB++;

      //   break;
      // case '뺴기':
      //   ints = newcountA == newcountA ? newcountA-- : newcountB--;
      //   break;
      // default:
      //   -1;
    }
    // double newtodel = state.total;
    // switch (total) {
    //   case '증가':
    //     newtodel = state.number1.toDouble() * newcountA.toDouble();
    //     break;
    //   case '감소':
    //     newtodel = state.number2.toDouble() * newcountA.toDouble();
    //     break;
    //   default:
    //     -1;
    // }
    // state = state.copyWith(total: newtodel);

    state = state.copyWith(countA: newcountA);
    state = state.copyWith(countB: newcountB);
  }
}

// void bottonsB(String plus, total) {
//   int newcountB = state.countB;
//   switch (plus) {
//     case '더하기':
//       newcountB++;
//       break;
//     case '뺴기':
//       newcountB--;
//       break;
//     default:
//       -1;
//   }

//   double newtodel = state.total;
//   switch (total) {
//     case '증가':
//       newtodel = state.number1.toDouble() * newcountB.toDouble();
//       break;
//     case '감소':
//       newtodel = state.number2.toDouble() * newcountB.toDouble();
//       break;
//     default:
//       -1;
//   }
//   state = state.copyWith(total: newtodel);

//   state = state.copyWith(countB: newcountB);
// }

// 변해야하는것
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

// // 가격
// void totals(String total) {
//   var newtodel = state.total.toInt();
//   switch (total) {
//     case 'queen':
//       newtodel = state.number1 * state.countA;
//       break;
//     case 'shirt':
//       newtodel = state.number2 * state.countB;
//       break;
//     default:
//       0;
//   }
//   state = state.copyWith(total: newtodel.toDouble());
// }
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

//토탈

//총가격 ?

final homeprovider = NotifierProvider<HomeViewModel, HomeModel>(
  HomeViewModel.new,
);
