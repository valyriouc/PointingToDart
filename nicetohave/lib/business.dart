
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
  DatabaseProvider provider;
  final String _sql = '''
  SELECT * FROM todo;
  ''';

  int get count => {
    if (_resultSet is null) {
      queryData();
    }

    return this._resultSet!.
  };

  ShowTodoUseCase(this.provider);


  ResultSet? _resultSet;
  void queryData() {
    Database db = provider.produce();
    _resultSet = db.select(_sql);
    db.dispose();
  }
}