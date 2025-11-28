import 'package:flutter_git_test/11_27/item/title/title_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleViewModel extends Notifier<TitleModel> {
  @override
  TitleModel build() {
    return TitleModel(queen: 'Ctton queen T', shirt: 'Greg T-shirt ');
  }
}

final titleprovider = NotifierProvider<TitleViewModel, TitleModel>(
  TitleViewModel.new,
);
