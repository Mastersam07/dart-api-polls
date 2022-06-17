import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

/// A connection to a PostgreSQL database.
class DBConnection {
  /// The underlying PostgreSQL connection.
  DBConnection(this.envVars);

  /// The underlying PostgreSQL connection environment.
  final DotEnv envVars;

  /// Open the underlying PostgreSQL connection.
  Future<void> open() async {
    final host = envVars['DB_HOST'] ?? 'localhost';
    final dbPort = envVars['DB_PORT'];
    final port = dbPort == null ? 5432 : int.parse(dbPort);
    final database = envVars['DB_DATABASE'] ?? 'database';
    final username = envVars['DB_USERNAME'] ?? 'username';
    final password = envVars['DB_PASSWORD'] ?? '';
    final connection = PostgreSQLConnection(
      host,
      port,
      database,
      username: username,
      password: password,
    );

    db = connection;
    await db.open();
  }

  /// The underlying PostgreSQL connection.
  Future<void> create() async {
    // Create data
    await open();
    await db.query(
      '''
  CREATE TABLE poll(
    id serial primary key not null,
    question text,
    pub_date timestamp,
    title text
  )
  ''',
    );
    await db.close();
  }

  /// Close the underlying PostgreSQL connection.
  Future<void> close() async {
    await db.close();
  }

  /// The connection to the database.
  late PostgreSQLConnection db;
}
