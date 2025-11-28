// 변해야하는것
class HomeModel {
  // 종류
  int number1;
  int number2;
  // 가격
  double total;
  // 세금
  int duty;
  // 갯수
  int count;

  HomeModel({
    required this.number1,
    required this.number2,
    required this.total,
    required this.duty,
    required this.count,
  });
  HomeModel copyWith({
    int? number1,
    int? number2,
    double? total,
    int? duty,
    int? count,
  }) {
    return HomeModel(
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      total: total ?? this.total,
      duty: duty ?? this.duty,
      count: count ?? this.count,
    );
  }
}
