
import 'package:flutter/material.dart';
import 'package:nicetohave/database.dart';
import 'package:sqlite3/sqlite3.dart';

class LoginUseCase {

}

class RegistrationUseCase {

}

class CreateTodoUseCase {

}

class ShowTodoUseCase {
  final String _sql = '''
  SELECT * FROM todo;
  ''';

  DatabaseProvider provider;
  late ResultSet? _result;

  int get count {
    if (_result == null) {
      queryData();
    }

    return _result!.length;
  }

  ShowTodoUseCase(this.provider);

  void queryData() {
    Database db = provider.produce();
    _result = db.select(_sql);
    db.dispose();
  }
}