import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_26_reverpod/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('숫자')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button('add', Icons.add, 'Add'),
              SizedBox(width: 5),
              button('remove', Icons.remove, 'Remove'),
            ],
          ),
          SizedBox(height: 10),
          button('riset', Icons.reset_tv, 'Riset'),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(homeprovider);
              return Text('${state.count}', style: TextStyle(fontSize: 40));
            },
          ),
        ],
      ),
    );
  }
}

Widget button(String type, IconData icon, String title) {
  return Consumer(
    builder: (context, ref, child) {
      return InkWell(
        onTap: () {
          final viewModel = ref.read(homeprovider.notifier); //  👈
          viewModel.numbers(type);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          width: 100,
          height: 50,
          decoration: BoxDecoration(color: Colors.blue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), SizedBox(width: 10), Text(title)],
          ),
        ),
      );
    },
  );
}
