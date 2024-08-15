// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardTaskModel {
  final String title;
  final String description;
  final DateTime date;
  final bool completed;

  const CardTaskModel({required this.title, required this.description, required this.date, required this.completed});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'completed': completed,
    };
  }

  factory CardTaskModel.fromMap(Map<String, dynamic> map) {
    return CardTaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardTaskModel.fromJson(String source) => CardTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CardTaskModel copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? completed,
  }) {
    return CardTaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      completed: completed ?? this.completed,
    );
  }
}
