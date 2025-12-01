import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_29/leverpod/shop/model.dart';
import 'package:flutter_git_test/11_29/leverpod/shop/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: ShopPage())));
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 화면
      //앱바 텍스트
      appBar: AppBar(title: Text('Shopping Bag')),
      //1 칸 2번
      //바디 컬럼 /
      body: Column(
        children: [
          //로우 이미지 컬럼 /
          type(0, 'A'),
          type(1, 'B'),
          Column(
            children: [
              //텍스트 가격 /
              Row(
                children: [
                  //로우 버튼 숫자 버튼  /
                ],
              ),

              // 컨테이터 텍스트 /
            ],
          ),
          //2 칸 3번
          // 로우 텍스트 금액
          Row(
            children: [
              //
            ],
          ),
          Container(
            color: Colors.deepOrangeAccent,
            child: Text(
              'Proceed to Checkout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// 화면단 품목 = 이미지 , 제품 , 가격 , 숫자 , 사이즈 / 작동하는것 숫자
Widget type(int index, String type) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Image.network(queen[index]['이미지']!),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(queen[index]['이름']!),
          Text((queen[index]['가격']!)),
          // 하나의 함수를 두개로 늘려서 사용하려고해 그래서 인덱스를 썻고 에이는 해당 타입이야
          counts('A'),

          // 컨테이터 텍스트 /
        ],
      ),
      SizedBox(width: 5),
      SizedBox(width: 50, height: 50, child: Text(queen[index]['사이즈']!)),
    ],
  );
}

Widget counts(String type) {
  //텍스트 가격 /
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(viewModelprovider1129);

      return Row(
        children: [
          //로우 버튼 숫자 버튼  /
          IconButton(
            onPressed: () {
              // ref.read(viewModelprovider1129.notifier).counts(type, '증가');
            },
            icon: Icon(Icons.add_circle, color: Colors.grey),
          ),
          SizedBox(width: 5),

          Text(type == 'A' ? '${state.count1}' : '${state.count2}'),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {
              // ref.read(viewModelprovider1129.notifier).counts(type, '감소');
            },
            icon: Icon(Icons.remove_circle, color: Colors.grey),
          ),
        ],
      );
    },
  );
}



// 총 가격 = 품목 ,가격 

//1 칸 2번 
//바디 컬럼 /로우 이미지 컬럼 /텍스트 가격 /로우 버튼 숫자 버튼  / 컨테이터 텍스트 / 

// 컨테이너 텍스트 

// 로직 
// 버튼 에 따라 숫자 랑 가격 이  달라진다 

// 데이터 

// 품목 2개 숫자 2개 금액 3개 

// 선택  
//1칸
//이미지 이름 가격 숫자  사이즈  

// 2칸 
// 이름 가격 