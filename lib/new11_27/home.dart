import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_27/total/total_page.dart';

import 'package:flutter_git_test/new11_27/home_view.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text('페이지')),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(homeprovider);
          return Column(
            children: [
              // 1칸
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    images('https://picsum.photos/102/102'),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 텍스트
                              Text(
                                'Ctton queen T',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              // 가격
                              Text(
                                '\$${state.total.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  // 버튼
                                  bottons('더하기', Icons.add, '증가'),
                                  SizedBox(width: 20),
                                  // 숫자
                                  Text(
                                    '${state.count}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  // 버튼
                                  bottons('뺴기', Icons.remove, '감소'),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          // 사이즈
                          sizes('S'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 2칸
              Row(
                children: [
                  // 토탈
                  // 가격
                  TotalPage(),

                  // 에러
                ],
              ),
              // 3칸
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),

                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.redAccent,
                ),
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              // 텍스트
            ],
          );
        },
      ),
    );
  }

  // 로직

  //종류 => 갯수  =>  가격 , 세금  => 총가격

  Widget bottons(String plus, IconData icon, String total) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),

          child: InkWell(
            onTap: () {
              ref.read(homeprovider.notifier).bottons(plus, total);
            },
            child: Icon(icon),
          ),
        );
      },
    );
  }
  //
  // 변해야하는것
  // 종류

  // 가격
  // Widget totals(double total) {
  //   return Text('$total');
  // }
  // 세금
  // 총가격
  //
  // 달라지는것

  //이미지
  Widget images(String image) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image)),
      ),
    );
  }

  //이름
  Widget name(String name) {
    return Text(name);
  }

  //사이즈
  Widget sizes(String size) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: Text(size, style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }
  //토탈

  //총가격
}
