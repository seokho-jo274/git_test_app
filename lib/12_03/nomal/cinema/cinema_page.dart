import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CinemaPage()));
}

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => CinemaPageState();
}

class CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seats')),

      // 컬럼
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),

            // 로우/ 5개의 10개 / 3-4
            number(1), // 1
            SizedBox(height: 5),
            number(2), // 2
            SizedBox(height: 5),
            number(3), // 3
            SizedBox(height: 5),
            number(4), // 4
            SizedBox(height: 5),
            number(5),
            // 로우 / 2개중 하나 노란색 불
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Available'),
                Container(
                  //
                ),
                SizedBox(width: 5),
                Text('Selected'),
                SizedBox(width: 5),
                Container(width: 30, height: 30, color: Colors.amber),
              ],
            ),
            // 텍스트
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Column(
                children: [
                  Text('선택된 좌석이 없습니다'),
                  ElevatedButton(onPressed: () {}, child: Text('Book Now')),
                ],
              ),
            ),

            // 버튼
          ],
        ),
      ),
    );
  }

  Widget number(int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$rowIndex',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),

        for (int seatIndex = 1; seatIndex <= 10; seatIndex++) ...[
          repeat(rowIndex, seatIndex),

          SizedBox(width: 5),
        ],
      ],
    );
  }

  Widget repeat(int rowIndex, int seatIndex) {
    bool name = rowIndex == 3 && seatIndex == 4;
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: name ? Colors.amber : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
