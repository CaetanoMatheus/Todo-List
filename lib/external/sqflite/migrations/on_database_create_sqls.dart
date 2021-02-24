final onDatabaseCreate = {
  'v1': [
    '''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        color TEXT
      );
    ''',
    '''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        done INTEGER,
        category_id INTEGER
      );
    '''
  ]
};
