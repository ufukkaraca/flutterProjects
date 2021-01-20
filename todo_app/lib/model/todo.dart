class Todo {

  // CLASS SPECIFICATIONS
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;
//

  // CONSTRUCTORS
  Todo(this._date, this._priority, this._title, [this._description]);
  Todo.withId(this._id, this._date, this._priority, this._title,
      [this._description]);
//

  // SETTERS AND GETTERS
  int get id => _id;
  String get description => _description;
  String get title => _title;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set date(String newdate) {
    _date = newdate;
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }
//


  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (id != null) map["id"] = _id;
    return map;
  }

  Todo.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._date = o["date"];
    this._priority = o["priority"];
  }
}
