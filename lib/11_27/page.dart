import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_27/item/botton/botton_page.dart';
import 'package:flutter_git_test/11_27/total/total_page.dart';

class Page1127 extends StatelessWidget {
  const Page1127({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('페이지')),
      body: Column(
        children: [
          item(),
          SizedBox(height: 10),
          item(),
          // 하단
          total(),
        ],
      ),
    );
  }
}

Widget item() {
  return Row(
    children: [
      // 이미지
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/100/100'),
            fit: BoxFit.cover,
          ),
        ),
      ),

      Column(
        children: [
          Text('Cotton queen T'),

          // 증가 버튼
          BottonPage(),

          // BottonViewModel() 직접이 아닌 컴슈머 를 사용해서 가져온다
          //숫자

          // 감소 버튼
        ],
      ),
      // 사이즈
    ],
  );
}

Widget total() {
  return TotalPage();
}
