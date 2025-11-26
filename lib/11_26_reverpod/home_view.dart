import 'package:flutter/material.dart';
import 'package:flutter_git_test/11_26_reverpod/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          // 📌 왼쪽 아이콘
          alignment: Alignment.centerLeft,
          child: Text('Edit', style: TextStyle(color: Colors.amber)),
        ),
        actions: [
          // 📌 오른쪽 아이콘
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.add, color: Colors.amber),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              clock('Add', Icons.add),
              //
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              // 시간 오전 스위치
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              // 시간 오전 스위치
            ],
          ),
        ],
      ),
    );
  }

  Widget clock(String name, IconData icon) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(viewModelProvider);
        return Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  ref.read(viewModelProvider.notifier);

                  return Row(children: [Text(name), Text('AM'), Icon(icon)]);
                },
              ),
              Text(state.title),
            ],
          ),
        );
      },
    );
  }
}
