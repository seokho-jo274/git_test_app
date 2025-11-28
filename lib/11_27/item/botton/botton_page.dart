import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_27/item/botton/botton_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottonPage extends StatelessWidget {
  const BottonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(bottonProvider);

            // Text('${state.top}');

            return Row(
              children: [
                number('더하기', Icons.add),

                //
                Text('${state.count}'),
              ],
            );
          },
        ),
        //
        number('뺴기', Icons.remove),
      ],
    );
  }
}

// Widget image(double total) {
//   return Text('$total');
// }

Widget number(String plus, IconData icon) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
    child: Consumer(
      builder: (context, ref, child) {
        // final state = ref.watch(bottonProvider);

        return InkWell(
          onTap: () {
            ref.read(bottonProvider.notifier).number(plus);
          },
          child: Icon(icon),
        );
      },
    ),
  );
}
