import 'package:flutter/material.dart';
import 'package:flutter_git_test/12_02/store/store_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  return runApp(ProviderScope(child: MaterialApp(home: StorePage())));
}

class StorePage extends StatelessWidget {
  const StorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: number()),
      body: images(),
    );
  }
}

Widget number() {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(storeViewModelProvider1202);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(state.first),
          Text(state[1]),
          Text(state[2]),
          Text(state.last),
        ],
      );
    },
  );
}

Widget images() {
  return Column(
    children: [
      Expanded(
        child: Image.network(
          width: double.infinity,
          fit: BoxFit.cover,
          'http://picsum.photos/1500/1500',
        ),
      ),
      SizedBox(height: 1),
      Expanded(
        child: Image.network(
          width: double.infinity,
          'http://picsum.photos/1001/1001',
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
