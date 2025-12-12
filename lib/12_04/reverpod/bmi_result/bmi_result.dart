import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_git_test/12_04/reverpod/bmi_page/bmi_view.dart';
import 'package:flutter_git_test/12_04/reverpod/bmi_page/bmi_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key});
  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      //
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),

            SizedBox(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(bimViewProvider);
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 250,
                        child: CircularProgressIndicator(
                          value: 1,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 250,
                        child: CircularProgressIndicator(
                          value: min(state.result / 35, 1),
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                      Text(
                        state.result.toStringAsFixed(1),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Consumer(
              builder: (context, ref, child) {
                return RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    children: [
                      TextSpan(text: 'Result:'),
                      TextSpan(
                        text: ref.read(bimViewProvider.notifier).resultText(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            '(BMI ${ref.read(bimViewProvider.notifier).resultBmi()})',
                      ),
                    ],
                  ),
                );
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(BmiView());
                },
                child: Text('CALCULATE'),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
