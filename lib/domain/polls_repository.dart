import 'package:polls_api/models/poll.dart';
import 'package:postgres/postgres.dart';

/// Abstracts the polls repository.
abstract class PollsRepository {
  /// Creates a new poll.
  Future<PostgreSQLResult> createPoll(Poll poll);

  /// Gets a poll by its ID.
  Future<List<Poll>> getAllPolls();

  /// Gets a poll by its ID.
  Future<List<Poll>> getPollById(String id);
}
