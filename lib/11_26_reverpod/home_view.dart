import 'package:flutter/cupertino.dart';
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
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(viewModelProvider);

          return Column(
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

              clock('A', state.isOns.aisOn, '7:00'),
              SizedBox(height: 1),
              clock('B', state.isOns.bisOn, '8:30'),
              SizedBox(height: 1),
              clock('C', state.isOns.cisOn, '8:00'),
            ],
          );
        },
      ),
    );
  }

  Widget clock(String name, bool isOns, String title) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        color: isOns ? CupertinoColors.white : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'AM',
                      style: TextStyle(
                        fontSize: 20,
                        color: isOns ? CupertinoColors.white : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final viewModel = ref.read(viewModelProvider.notifier);

                      return CupertinoSwitch(
                        value: isOns,
                        onChanged: (value) {
                          viewModel.numbers(name);
                        },

                        thumbColor: CupertinoColors.white, // 버튼색
                        activeTrackColor: isOns
                            ? CupertinoColors
                                  .activeBlue // 온 일떄
                            : CupertinoColors.activeGreen, // 오프 일떄
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Alarm',
              style: TextStyle(
                fontSize: 20,
                color: isOns ? CupertinoColors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
