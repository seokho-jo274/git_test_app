import 'package:flutter/material.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1 가격
        shope('subTotal', 0),

        //2 세금
        shope('shipping', 0),

        //3 총가격
        shope('bagTotal', 0),

        //4 텍스트
        // Container(child: Text('버튼')),
      ],
    );
  }
}

Widget shope(String title, int totals) {
  return Container(
    decoration: BoxDecoration(),

    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //왼쪽
        Text(title),
        // 오른쪽
        Text('$totals'),
      ],
    ),
  );
}
