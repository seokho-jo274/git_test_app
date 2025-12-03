import 'package:flutter/material.dart';
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
  List<String> list = ['woman', 'kids', 'shoes', 'Bag'];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text(list.first), Text(list[1]), Text(list[2]), Text(list.last)],
  );
}

Widget images() {
  return Column(
    children: [
      Expanded(
        child: Image.network(
          width: double.infinity,
          fit: BoxFit.cover,
          'http://picsum.photos/100/100',
        ),
      ),
      SizedBox(height: 1),
      Expanded(
        child: Image.network(
          width: double.infinity,
          'http://picsum.photos/101/101',
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
