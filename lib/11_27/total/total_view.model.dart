import 'package:flutter_git_test/11_27/total/total_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalViewModel extends Notifier<TotalModel> {
  @override
  TotalModel build() {
    return TotalModel(greg: 41, queen: 43, duty: 6, price: 0);
  }

  // void shope(String title) {
  //   switch (title) {
  //     case 'subTotal':
  //       Text('SubTotal');
  //       break;
  //     case 'shipping':
  //       Text('Shipping');
  //       break;
  //     case 'bagTotal':
  //       Text('BagTotal');
  //       break;
  //   }
  // }

  //
  void totals(String total) {
    // Consumer(
    //   builder: (context, ref, child) {
    // final states = ref.watch(homeprovider);

    // var top = state.price;
    // switch (total) {
    //   case '가격':
    //     top =
    //         (states.countA * states.number1) + (states.countB * states.number2);
    //     break;
    //   case '세금':
    //     top *= state.queen; // 43 증가
    //     break;
    //   case '총가격':
    //     // final toduty = top + state.duty;
    //     break;
    //   default:
    //     0;
    //     break;
    // }
    // },
    // );
    // state = state.copyWith(price: top); // 갯수
  }
}

// final total = (state.countA * state.number1) + (state.countB * state.number2);
// double totals = total.toDouble();

// //총가격
// final toduty = totals + state.duty;

final totalProvider = NotifierProvider<TotalViewModel, TotalModel>(
  () => TotalViewModel(),
);
