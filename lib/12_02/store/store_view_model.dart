import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreViewModel extends Notifier<List<String>> {
  @override
  List<String> build() {
    return ['woman', 'kids', 'shoes', 'Bag'];
  }
}

final storeViewModelProvider1202 =
    NotifierProvider<StoreViewModel, List<String>>(StoreViewModel.new);
