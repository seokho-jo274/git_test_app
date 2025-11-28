// 변해야하는것
class HomeModel {
  // 종류
  int number1;
  int number2;
  // 가격
  double total;
  // 세금
  double duty;
  // 갯수
  int countA;
  int countB;

  HomeModel({
    required this.number1,
    required this.number2,
    required this.total,
    required this.duty,
    required this.countA,
    required this.countB,
  });
  HomeModel copyWith({
    int? number1,
    int? number2,
    double? total,
    double? duty,
    int? countA,
    int? countB,
  }) {
    return HomeModel(
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      total: total ?? this.total,
      duty: duty ?? this.duty,
      countA: countA ?? this.countA,
      countB: countB ?? this.countB,
    );
  }
}
