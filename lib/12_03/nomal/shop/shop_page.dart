import 'package:flutter/material.dart';

void main() {
  runApp(ShopPage());
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State<ShopPage> createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  double todel = 0; // 가격
  int duty = 6; // 세금
  double number1 = 43; // 종류
  double number2 = 41;
  int countA = 0;
  int countB = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //
        //앱바
        appBar: AppBar(title: Text('연습')),
        //컬럼
        body: Column(
          children: [
            //로우 이미지
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/100/100'),
                    ),
                  ),
                  margin: EdgeInsets.all(20),
                ),
                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // /컬럼 텍스트 가걱 로우 +버튼 숫자 -버튼 / 컨테이너 텍스트
                  children: [
                    Text(
                      'Ctton queen T',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '43.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],

                            shape: BoxShape.circle,
                          ),

                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                countA += 1;
                              });
                            },

                            icon: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$countA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],

                            shape: BoxShape.circle,
                          ),

                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                countA--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,

                    shape: BoxShape.circle,
                  ),

                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/101/101'),
                    ),
                  ),
                  margin: EdgeInsets.all(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // /컬럼 텍스트 가걱 로우 +버튼 숫자 -버튼 / 컨테이너 텍스트
                  children: [
                    Text(
                      'Greg T-shirt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '41.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],

                            shape: BoxShape.circle,
                          ),

                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                countB++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$countB',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],

                            shape: BoxShape.circle,
                          ),

                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                countB--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,

                    shape: BoxShape.circle,
                  ),

                  child: Text(
                    'M',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],

          // 로우 텍스트 가격
          // 로우 텍스트 가격
          // 로우 텍스트 가격 생상

          // 컨테이너 둥굴게 텍스트 색상
        ),
      ),
    );
  }
}
