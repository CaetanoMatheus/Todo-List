// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    json['id'] as int,
    json['title'] as String,
    json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    json['done'] as bool,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
      'category': instance.category,
    };
