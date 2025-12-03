import 'package:flutter_git_test/12_03/reverpod/cinema/cinema_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CinemaViewModel extends Notifier<CinemaModel> {
  @override
  CinemaModel build() {
    return CinemaModel(columnCount: 0, rowCount: 0, total: '');
  }

  void touchs(int index, int i) {
    var column = index;
    var row = i;
    state = state.copyWith(
      columnCount: column,
      rowCount: row,
      total: state.total == '$index-$i' ? '' : '$index-$i',
    );
  }
}

final cinemaProvider = NotifierProvider<CinemaViewModel, CinemaModel>(
  CinemaViewModel.new,
);
