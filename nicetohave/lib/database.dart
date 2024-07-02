import 'package:sqlite3/sqlite3.dart';

void PrepareDatabase() {
  Database db = sqlite3.openInMemory();
  
  db.execute(
    '''
    CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
    )
  ''');

  db.execute(
    '''
    CREATE TABLE IF NOT EXISTS tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      is_done INTEGER DEFAULT 0,
      user_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES users(id))
    ''');

  db.dispose();
}