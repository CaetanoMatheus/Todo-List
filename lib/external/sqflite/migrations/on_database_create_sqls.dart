final onDatabaseCreate = {
  'v1': [
    '''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        done INTEGER
      );
    '''
  ]
};
