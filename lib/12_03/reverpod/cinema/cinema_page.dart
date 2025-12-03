import 'package:flutter/material.dart';
import 'package:flutter_git_test/12_03/reverpod/cinema/cinema_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: CinemaPage())));
}

class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('Seats')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Screen',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: numbers(index + 1),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Available'),
                      SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.all(2.0),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text('Selected'),
                      Container(
                        margin: EdgeInsets.all(2.0),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(cinemaProvider);
                    return Text(
                      state.total == ''
                          ? '선택된 좌석이 없습니다'
                          : '${state.columnCount}-${state.rowCount} ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          content: Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(cinemaProvider);

                              return Text(
                                state.total == ''
                                    ? '좌석을 선택 해주세요!'
                                    : '${state.total}\n예매하시겠습니까!',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                button('확인', context),
                                button('닫기', context),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Book now',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget numbers(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$index',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        for (var i = 1; i <= 10; i++) boxs(index, i),
      ],
    );
  }

  Widget boxs(int index, int i) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(cinemaProvider);
        final pop = ref.read(cinemaProvider.notifier);
        String text = '$index-$i';
        return GestureDetector(
          onTap: () {
            pop.touchs(index, i);
          },
          child: Container(
            margin: EdgeInsets.all(2.0),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: text == state.total ? Colors.amber : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

Widget button(String type, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Text(type),
  );
}
