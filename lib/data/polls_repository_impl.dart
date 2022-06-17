import 'package:polls_api/database/connection.dart';
import 'package:polls_api/domain/polls_repository.dart';
import 'package:polls_api/models/poll.dart';
import 'package:postgres/postgres.dart';

/// A polls repository implementation.
class PollsRepositoryImpl implements PollsRepository {
  /// Creates a new polls repository.
  PollsRepositoryImpl(this.dbConnection);

  /// Creates a new polls repository.
  DBConnection dbConnection;

  @override
  Future<PostgreSQLResult> createPoll(Poll poll) async {
    await dbConnection.open();
    // TODO(mastersam): FIX BUG
    final query = await dbConnection.db.query(
      '''
      INSERT INTO poll
      (
        question,
        title,
        pub_date,
        id
      )
      VALUES
      (
        ${poll.question},
        ${poll.createdBy},
        ${poll.pubDate},
        ${DateTime.now().millisecondsSinceEpoch.toString()},
      );
      ''',
    );
    await dbConnection.close();

    return query;
  }

  @override
  Future<List<Poll>> getPollById(String id) async {
    await dbConnection.open();
    final List<List<dynamic>> queryResult =
        await dbConnection.db.query('SELECT * FROM poll WHERE id = $id');
    await dbConnection.close();

    final polls = <Poll>[];

    for (final row in queryResult) {
      polls.add(
        Poll(
          id: row[0] as String,
          question: row[1] as String,
          createdBy: row[2] as String,
          pubDate: DateTime.parse(row[3] as String),
        ),
      );
    }

    return polls;
  }

  @override
  Future<List<Poll>> getAllPolls() async {
    await dbConnection.open();
    final List<List<dynamic>> queryResult = await dbConnection.db.query(
      'SELECT * FROM poll',
    );
    await dbConnection.close();

    final polls = <Poll>[];

    for (final row in queryResult) {
      polls.add(
        Poll(
          id: row[0] as String,
          question: row[1] as String,
          createdBy: row[2] as String,
          pubDate: DateTime.parse(row[3] as String),
        ),
      );
    }

    return polls;
  }
}
