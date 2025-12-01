import 'package:flutter/material.dart';
import 'package:flutter_git_test/12-01/test_test/tasta_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: TastaPage())));
}

class TastaPage extends StatefulWidget {
  const TastaPage({super.key});
  @override
  State<TastaPage> createState() => TastaPageState();
}

class TastaPageState extends State<TastaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('예제 페이지')),
      body: SizedBox.expand(
        child: Column(
          children: [
            Row(
              children: [
                button('증가', Icons.add, '더하기'),
                SizedBox(width: 5),
                button('감소', Icons.remove, '빼기'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                button('곱하기', Icons.close, '곱하기'),
                SizedBox(width: 5),
                button('초기화', Icons.refresh, '초기화'),
              ],
            ),
            Expanded(
              child: Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(tastaProvider);
                    return Text(
                      '${state.count}',
                      style: TextStyle(fontSize: 40),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget button(String type, IconData icon, String name) {
  return Consumer(
    builder: (context, ref, child) {
      final buttons = ref.read(tastaProvider.notifier);
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
          color: Colors.grey[300],

          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  buttons.button(type);
                },
                icon: Icon(icon),
              ),

              Text(name),
            ],
          ),
        ),
      );
    },
  );
}




// 같은거 4개 컨테이너 
// 텍스트 + 아이콘

// 숫자 