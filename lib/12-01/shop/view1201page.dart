import 'package:flutter/material.dart';
import 'package:flutter_git_test/12-01/shop/view_modal1201.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: View1201page())));
}

class View1201page extends StatelessWidget {
  const View1201page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('연습')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(viewModal1201provider); // 변화를 감지하고 리빌드한다

            return Row(
              children: [
                // 버튼을 누르면 리빌드 한다
                counts('+'),
                Text('${state.count1}'),
                counts('-'),
                //
              ],
            );
          },
        ),
      ),
    );
  }

  //  버튼 + - 숫자
  Widget counts(String type) {
    return Consumer(
      builder: (context, ref, child) {
        final view = ref.read(viewModal1201provider.notifier); // 한번 읽고 확인한다

        return Column(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                onTap: () {
                  // 눌렀을때  타입을 나눌 함수 작동해 나눈다
                  view.counts(type);
                },
                child: Icon(type == 'A' ? Icons.add : Icons.remove),
              ),
            ),
          ],
        );
      },
    );
  }
}


// count라는 변수가 있다 (초기값 0)

// 숫자를 더해주는 함수 increase() 만들기

// 숫자를 빼주는 함수 decrease() 만들기

// 버튼을 누르면 해당 함수가 실행돼야 한다

// ❓ 질문

// ➡ increase() / decrease() 함수 선언은 어떤 형태로 만들 거 같아? (반환값은 필요 없음)