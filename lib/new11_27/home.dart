import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_27/total/total_page.dart';
import 'package:flutter_git_test/new11_27/home_view.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Bag',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final stste = ref.watch(homeprovider);

          return Column(
            children: [
              // 1칸
              title(
                'queen',
                'https://picsum.photos/100/100',
                'Ctton queen T',
                'S',
                '\$43.00',
                '${stste.countA}',
                'A',
              ),
              SizedBox(height: 10),
              title(
                'shirt',
                'https://picsum.photos/101/101',
                'Greg T-shirt',
                'M',
                '\$41.00',
                '${stste.countB}',
                'B',
              ),
              // 2칸
              Spacer(),
              Row(children: [TotalPage()]),
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
            ],
          );
        },
      ),
    );
  }

  // 로직
  //종류 => 갯수  =>  가격 , 세금  => 총가격
  // view => title 2개늘리고 => 버튼 하나 를 2개로 더하고 뺀다
  // 종류
  Widget title(
    String titlenumber,
    String imagenumber,
    String namenumber,
    String sizenumber,
    String totalnumber,
    String countnumber,
    String type,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(homeprovider);
        return Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지
              images(imagenumber),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 텍스트
                        Text(
                          namenumber,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        // 가격
                        Text(
                          totalnumber,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            // 버튼
                            bottons(type, Icons.add, '더하기'), //
                            SizedBox(width: 20),
                            // 숫자
                            Text(
                              countnumber,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 20),
                            // 버튼
                            bottons(type, Icons.remove, '빼기'), //
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    // 사이즈
                    sizes(sizenumber),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget bottons(String type, IconData icon, String action) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(homeprovider);

        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),

          child: InkWell(
            onTap: () {
              ref.read(homeprovider.notifier).bottons(type, action);
            },
            child: Icon(icon),
          ),
        );
      },
    );
  }

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
  Widget names(String name) {
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

  // 가격
  Widget totals(double total) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(homeprovider);
        return Text('\$${state.total.toStringAsFixed(2)}');
      },
    );
  }
}
