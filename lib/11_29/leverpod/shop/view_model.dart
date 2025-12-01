import 'package:flutter_git_test/11_29/leverpod/shop/model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel1129 extends Notifier<Model1129> {
  @override
  Model1129 build() {
    return Model1129(
      number1: 43,
      number2: 41,
      count1: [1, 1],
      count2: 1,
      price: 0,
      duty: 6,
      total: 0,
    );
  }

  //   void counts(int type, String name) {
  //     var countA = state.count1;
  //     var countB = state.count2;

  //     if (type == 'A') {
  //       if (name == '증가') countA[type]++;
  //       if (name == '감소' && countA[type] > 1) countA[type]--;
  //     }
  //     if (type == 'B') {
  //       if (name == '증가') countB++;
  //       if (name == '감소' && countB > 1) countB--;
  //     }
  //     state = state.copyWith(count1: countA, count2: countB);
  //   }
}

void totals() {}

final viewModelprovider1129 = NotifierProvider<ViewModel1129, Model1129>(
  ViewModel1129.new,
);

// 로직 
// 버튼 에 따라 숫자 랑 가격 이  달라진다 


// 선택  
//1칸
//이미지 이름 가격 숫자  사이즈  

// 2칸 
// 이름 가격 