import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  final String host;
  final int port;
  final String user;
  final String password;
  final String dbName;

  MySqlConnection? _connection;

  DatabaseHelper({
    required this.host,
    required this.port,
    required this.user,
    required this.password,
    required this.dbName,
  });

  Future<void> connect() async {
    try {
      var settings = ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: dbName,
      );
      _connection = await MySqlConnection.connect(settings);
      print('Successfully connected to the database');
    } catch (e) {
      print('Error while connecting to the database: $e');
    }
  }

  Future<void> close() async {
    await _connection?.close();
    _connection = null;
    print('Database connection closed');
  }

  Future<void> createTable() async {
    var query = '''
    CREATE TABLE IF NOT EXISTS users (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100),
      email VARCHAR(100)
    )
    ''';

    try {
      await _connection?.query(query);
      print('Table created successfully');
    } catch (e) {
      print('Error creating table: $e');
    }
  }

  Future<void> insertUser(String name, String email) async {
    var query = 'INSERT INTO users (name, email) VALUES (?, ?)';

    try {
      await _connection?.query(query, [name, email]);
      print('User inserted successfully');
    } catch (e) {
      print('Error inserting user: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    var query = 'SELECT * FROM users';
    var results = <Map<String, dynamic>>[];

    try {
      var result = await _connection?.query(query);
      for (var row in result!) {
        results.add({'id': row['id'], 'name': row['name'], 'email': row['email']});
      }
    } catch (e) {
      print('Error fetching users: $e');
    }

    return results;
  }

  Future<void> updateUser(int id, String name, String email) async {
    var query = 'UPDATE users SET name = ?, email = ? WHERE id = ?';

    try {
      await _connection?.query(query, [name, email, id]);
      print('User updated successfully');
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<void> deleteUser(int id) async {
    var query = 'DELETE FROM users WHERE id = ?';

    try {
      await _connection?.query(query, [id]);
      print('User deleted successfully');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
