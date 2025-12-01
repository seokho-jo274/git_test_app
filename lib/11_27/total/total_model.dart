class TotalModel {
  //가격
  double queen;
  double greg;
  // 세금
  double duty;
  double price;

  double countA;
  double countB;

  TotalModel({
    required this.greg,
    required this.queen,
    required this.price,
    required this.countA,
    required this.countB,
    required this.duty,
  });
  TotalModel copyWith({
    double? greg,
    double? queen,
    double? price,
    double? duty,
    double? countA,
    double? countB,
  }) {
    return TotalModel(
      greg: greg ?? this.greg,
      queen: queen ?? this.queen,
      countA: countA ?? this.countA,
      countB: countB ?? this.countB,
      price: price ?? this.price,
      duty: duty ?? this.duty,
    );
  }
}
