import 'package:flutter/cupertino.dart';

class Note {
  int id;
  String note;

  Note({@required this.id, @required this.note});

  Note copyWith({
    int id,
    String note,
  }) {
    return Note(id: id ?? this.id, note: note ?? this.note);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': note,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(id: json['id'], note: json['body']);
}
