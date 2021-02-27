class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;
  Note(this._title, this._date, this._description, [this._priority]);

  Note.withId(this._id, this._title, this._date, this._description,
      [this._priority]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    this._title = newTitle;
  }

  set description(String newDescription) {
    this._description = newDescription;
  }

  set priority(int newPriority) {
    this._priority = newPriority;
  }

  set date(String newDate) {
    this.title = newDate;
  }

  set id(int newId) {
    this._id = newId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this.date = map['date'];

    
  }
}
