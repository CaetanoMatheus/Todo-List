class Todo {
  int _id;
  String _title;
  bool _done;

  Todo(int id, String title, [bool done]) {
    this.id = id;
    this.title = title;
    this.done = done;
  }

  int get id => this._id;
  String get title => this._title;
  bool get done => this._done;

  set id(int id) => this._id = id;
  set title(String title) => this._title = title;
  set done(bool done) => this._done = done ?? false;
}
