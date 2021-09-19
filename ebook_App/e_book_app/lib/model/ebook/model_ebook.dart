import 'package:json_annotation/json_annotation.dart';
part 'model_ebook.g.dart';

@JsonSerializable()
class ModelEbook {
  String? id;
  String? title;
  String? photo;
  String? description;
  int? cat_id;
  int? status_news;
  String? pdf;
  String? date;
  String? author_name;
  String? publisher_name;
  int? pages;
  String? language;
  int? rating;
  int? free;

  ModelEbook(
      {this.id,
      this.title,
      this.photo,
      this.description,
      this.cat_id,
      this.status_news,
      this.pdf,
      this.date,
      this.author_name,
      this.publisher_name,
      this.pages,
      this.language,
      this.rating,
      this.free});

  factory ModelEbook.fromJson(Map<String, dynamic> json) =>
      _$ModelEbookFromJson(json);

  Map<String, dynamic> toJson() => _$ModelEbookToJson(this);
}
