import 'package:flutter/material.dart';
import 'package:flutter_git_test/12_04/reverpod/bmi_page/bmi_theme.dart';
import 'package:flutter_git_test/12_04/reverpod/bmi_page/bmi_view_model.dart';
import 'package:flutter_git_test/12_04/reverpod/bmi_result/bmi_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: lightTheme1204,
        darkTheme: dartTheme1204,
        home: BmiView(),
      ),
    ),
  );
}

class BmiView extends StatelessWidget {
  const BmiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(children: [stackBox(), SizedBox(width: 10), boxs()]),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [sliders(), SizedBox(height: 100), sized()],
              ),
            ),
            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 56,
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(bimViewProvider);
                  return ElevatedButton(
                    onPressed: () {
                      final meterHeight = state.height / 100;
                      state.result = state.weight / (meterHeight * meterHeight);
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => BmiResult()));
                      //
                    },
                    child: Text('CALCULATE'),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      //
    );
  }
}

Widget stackBox() {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(bimViewProvider);
      return Flexible(
        fit: FlexFit.tight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(bimViewProvider.notifier).onbutton(true);
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(border: Border.all(width: 1)),
              ),
            ),

            Positioned(
              top: 10,
              left: 10,
              child: Opacity(opacity: 0.3, child: Icon(Icons.male, size: 80)),
            ),
            Positioned(
              bottom: 10,
              right: 10,

              child: Opacity(
                opacity: state.isMale ? 1 : 0.3,
                child: Text(
                  'MALE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget boxs() {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(bimViewProvider);
      return Flexible(
        fit: FlexFit.tight,
        child: GestureDetector(
          onTap: () {
            ref.read(bimViewProvider.notifier).onbutton(false);
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(opacity: 0.3, child: Icon(Icons.female, size: 80)),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: state.isMale ? 0.3 : 1,
                        child: Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget sliders() {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(bimViewProvider);
      return Stack(
        children: [
          SizedBox(width: double.infinity, height: 80),
          //
          Positioned(
            left: 10,
            child: Text('HEIGHT', style: TextStyle(fontSize: 20)),
          ),
          Positioned(
            right: 40,
            child: Text(
              '${state.height}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 40,
            child: Text('cm', style: TextStyle(fontSize: 20)),
          ),
          Positioned(
            top: 0,
            right: 10,
            left: 10,
            child: Slider(
              value: state.height.toDouble(),
              max: 300,
              min: 1,
              onChanged: (height) {
                ref.read(bimViewProvider.notifier).newheight(height.toInt());
              },
            ),
          ),
        ],
      );
    },
  );
}

Widget sized() {
  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(bimViewProvider);
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('WEIGHT', style: TextStyle(fontSize: 20)),
                Spacer(),
                Text(
                  '${state.weight}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                Text('kg', style: TextStyle(fontSize: 20)),
              ],
            ),

            Slider(
              value: state.weight.toDouble(),
              onChanged: (weight) {
                ref.read(bimViewProvider.notifier).newweight(weight.toInt());
              },
              min: 1,
              max: 300,
            ),
          ],
        ),
      );
    },
  );
}
