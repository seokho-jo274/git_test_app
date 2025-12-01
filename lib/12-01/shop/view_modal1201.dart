import 'package:flutter_git_test/12-01/shop/model1201.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModal1201 extends Notifier<Model1201> {
  @override
  Model1201 build() {
    return Model1201(count1: 0, count2: 0);
  }

  void counts(String type) {
    // 둘로 나누어 하나의 값을 선택한다
    var countA = state.count1;
    // var countB = state.count2;

    //기존 count1를 A에 대입해
    // 일단 에이 인지 비 인지

    type == '+' ? state.count1 : state.count2;
    // + - 나눈다
    switch (type) {
      case '+': // 맞다면 더한다
        countA++;
        break;
      case '-': // 맞다면 뺸다
        countA--;
        break;
    }
    // 기존 데이터 새데이터로 교체 한다
    state = state.copyWith(count1: countA);
  }
}

final viewModal1201provider = NotifierProvider<ViewModal1201, Model1201>(
  ViewModal1201.new,
);
