class TotalModel {
  //가격
  int queen;
  int greg;
  // 세금
  int duty;
  int price;

  TotalModel({
    required this.greg,
    required this.queen,
    required this.price,

    required this.duty,
  });
  TotalModel copyWith({int? greg, int? queen, int? price, int? duty}) {
    return TotalModel(
      greg: greg ?? this.greg,
      queen: queen ?? this.queen,
      //
      price: price ?? this.price,
      duty: duty ?? this.duty,
    );
  }
}
