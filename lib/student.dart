// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  String name;
  int rollNo;
  double fee;
  Student({
    required this.name,
    required this.rollNo,
    required this.fee,
  });

  

  Student copyWith({
    String? name,
    int? rollNo,
    double? fee,
  }) {
    return Student(
      name: name ?? this.name,
      rollNo: rollNo ?? this.rollNo,
      fee: fee ?? this.fee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rollNo': rollNo,
      'fee': fee,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      rollNo: map['rollNo'] as int,
      fee: map['fee'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Student(name: $name, rollNo: $rollNo, fee: $fee)';

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.rollNo == rollNo &&
      other.fee == fee;
  }

  @override
  int get hashCode => name.hashCode ^ rollNo.hashCode ^ fee.hashCode;
}
