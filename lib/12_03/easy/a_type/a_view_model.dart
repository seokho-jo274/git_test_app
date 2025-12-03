import 'package:flutter_git_test/12_03/easy/a_type/a_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AViewModel extends Notifier<AModel> {
  @override
  AModel build() {
    return AModel(0);
  }

  // void plus() {
  //   // return count++;
  // }
}

final aTextprovider = NotifierProvider<AViewModel, AModel>(AViewModel.new);
