import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeViewModel extends Notifier<dynamic> {
  @override
  build() {
    return;
  }

  void icons() {}

  void images() {}
}

final recipeViewModelProvider = NotifierProvider<RecipeViewModel, dynamic>(
  RecipeViewModel.new,
);
