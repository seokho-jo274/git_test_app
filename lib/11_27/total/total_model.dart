class TotalModel {
  //가격
  int queen;
  int greg;
  // 세금
  int duty;
  int price;
  // //
  // String subTotal;
  // String shipping;
  // String bagTotal;

  TotalModel({
    required this.greg,
    required this.queen,
    required this.price,
    // required this.shipping,
    // required this.bagTotal,
    // required this.subTotal,
    required this.duty,
  });
  TotalModel copyWith({
    int? greg,
    int? queen,
    int? price,
    int? duty,
    // String? subTotal,
    // String? shipping,
    // String? bagTotal,
  }) {
    return TotalModel(
      greg: greg ?? this.greg,
      queen: queen ?? this.queen,
      //
      price: price ?? this.price,
      duty: duty ?? this.duty,
      // shipping: shipping ?? this.shipping,
      // subTotal: subTotal ?? this.subTotal,
      // bagTotal: bagTotal ?? this.bagTotal,
    );
  }
}
