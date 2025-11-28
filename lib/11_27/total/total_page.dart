import 'package:flutter/material.dart';

import 'package:flutter_git_test/new11_27/home_view.model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(homeprovider);

        //토탈
        final total =
            (state.countA * state.number1) + (state.countB * state.number2);
        double totals = total.toDouble();

        final toduty = totals + state.duty;

        return Column(
          children: [
            //1 가격
            shope('SubTotal', totals),

            //2 세금
            shope('Shipping', state.duty),

            //3 총가격
            shope('BagTotal', toduty),
          ],
        );
      },
    );
  }
}

Widget shope(String title, double totals) {
  bool color = (title == 'BagTotal');

  return Container(
    margin: EdgeInsets.only(left: 20),
    width: 350,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //왼쪽
        Text(title),
        // 오른쪽
        Text(
          '\$${totals.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: color ? 30 : 20,
            color: color ? Colors.redAccent : Colors.black,
          ),
        ),
      ],
    ),
  );
}
