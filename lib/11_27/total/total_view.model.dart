import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_27/total/total_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalViewModel extends Notifier<TotalModel> {
  @override
  TotalModel build() {
    return TotalModel(greg: 41, queen: 43, duty: 6, price: 0);
  }

  void shope(String title) {
    switch (title) {
      case 'subTotal':
        Text('SubTotal');
        break;
      case 'shipping':
        Text('Shipping');
        break;
      case 'bagTotal':
        Text('BagTotal');
        break;
    }
  }

  //
  void totals(String total) {
    var top = state.price;
    switch (total) {
      case 'greg':
        top *= state.greg; //. 41 증가
        break;
      case 'queen':
        top *= state.queen; // 43 증가
        break;
      case 'duty':
        state.duty; // 세금 고정 6
        break;
      default:
        0;
        break;
    }
    state = state.copyWith(price: top); // 갯수
  }
}
