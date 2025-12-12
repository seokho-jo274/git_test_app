class BmiModel {
  bool isMale;
  int height;
  int weight;
  double result;

  BmiModel({
    required this.isMale,
    required this.height,
    required this.weight,
    required this.result,
  });
  BmiModel copyWith({bool? isMale, int? height, int? weight, double? result}) {
    return BmiModel(
      isMale: isMale ?? this.isMale,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      result: result ?? this.result,
    );
  }
}
