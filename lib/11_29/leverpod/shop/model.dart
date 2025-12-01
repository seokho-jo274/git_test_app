// Map + List + 반복문	👍 쉬움 + 자동 생성
// Model 클래스 + List	🚀 가장 좋은 방식 (Freezed, Riverpod과 궁합 최고!)
// 궁금한 점 2개의 차이 / 파라미터 사용해서 오타 방치 차이 인가?

// Image.network(queen[index]['이미지']!= null), / !=null 값을 판단 라는 뜻인데 에러 가 나는지 모르겟음

//Map<String, int> number = {'count': 1}; 정했는데도 왜 넌 List<int?> number = [null, null]; 인식

// 물품
final queen = [
  {
    '이미지': 'https://picsum.photos/100/100',
    '이름': 'Ctton queen T',
    '가격': '\$43.00',
    '사이즈': 'S',
  },
  {
    '이미지': 'https://picsum.photos/101/101',
    '이름': 'Greg T-shirt',
    '가격': '\$41.00',
    '사이즈': 'M',
  },
];
Map<String, int> number = {'count': 1};

class Model1129 {
  int number1;
  int number2;
  //
  List<int> count1;
  int count2;
  //
  double price; // 가격
  double duty; // 세금
  double total; // 총가격
  Model1129({
    required this.number1,
    required this.number2,
    required this.count1,
    required this.count2,
    required this.price,
    required this.duty,
    required this.total,
  });
  Model1129 copyWith({
    List<int>? count1,
    int? count2,
    double? price,
    double? duty,
    double? total,
  }) {
    return Model1129(
      number1: number1,
      number2: number2,
      count1: count1 ?? this.count1,
      count2: count2 ?? this.count2,
      price: price ?? this.price,
      duty: duty ?? this.duty,
      total: total ?? this.total,
    );
  }
}


// 화면
//앱바 텍스트

//1 칸 2번 
//바디 컬럼 /로우 이미지 컬럼 /텍스트 가격 /로우 버튼 숫자 버튼  / 컨테이터 텍스트 / 
//2 칸 3번
// 로우 텍스트 금액 

// 컨테이너 텍스트 

// 로직 
// 버튼 에 따라 숫자 랑 가격 이  달라진다 

// 데이터 

// 품목 2개 숫자 2개 금액 3개 

// 선택  
//1칸
//이미지 이름 가격 숫자  사이즈  

// 2칸 
// 이름 가격 


