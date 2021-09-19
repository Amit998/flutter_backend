// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_ebook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelEbook _$ModelEbookFromJson(Map<String, dynamic> json) {
  return ModelEbook(
    id: json['id'] as String,
    title: json['title'] as String,
    photo: json['photo'] as String,
    description: json['description'] as String,
    cat_id: json['cat_id'] as int,
    status_news: json['status_news'] as int,
    pdf: json['pdf'] as String,
    date: json['date'] as String,
    author_name: json['author_name'] as String,
    publisher_name: json['publisher_name'] as String,
    pages: json['pages'] as int,
    language: json['language'] as String,
    rating: json['rating'] as int,
    free: json['free'] as int,
  );
}

Map<String, dynamic> _$ModelEbookToJson(ModelEbook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photo': instance.photo,
      'description': instance.description,
      'cat_id': instance.cat_id,
      'status_news': instance.status_news,
      'pdf': instance.pdf,
      'date': instance.date,
      'author_name': instance.author_name,
      'publisher_name': instance.publisher_name,
      'pages': instance.pages,
      'language': instance.language,
      'rating': instance.rating,
      'free': instance.free,
    };
