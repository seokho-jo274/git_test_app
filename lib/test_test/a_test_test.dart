import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: ATestTest(),
    ),
  );
}

class ATestTest extends StatefulWidget {
  const ATestTest({super.key});

  @override
  State<ATestTest> createState() => _ATestTestState();
}

class _ATestTestState extends State<ATestTest> {
  double text = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: 20,
              left: text,
              child: Icon(
                Icons.notifications,
                color: theme.colorScheme.onPrimary,
                size: 40,
              ),
            ),

            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (text > 0) text -= 10;
                      });
                    },
                    child: Text('왼쪽 버튼'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (text < 200) text += 10;
                      });
                    },
                    child: Text('오른쪽 버튼'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //
    );
  }
}
