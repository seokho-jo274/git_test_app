import 'package:flutter/material.dart';

import 'package:flutter_git_test/new11_27/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        //
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
