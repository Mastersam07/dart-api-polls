import 'package:dart_frog/dart_frog.dart';

import 'package:polls_api/domain/polls_repository.dart';
import 'package:polls_api/models/poll.dart';

/// A polls service
class PollsService {
  /// Creates a new polls service.
  PollsService(this._pollsRepository);
  final PollsRepository _pollsRepository;

  /// Creates a new poll.
  Future<Response> addPoll(
    Map<String, dynamic> pollData,
  ) async {
    try {
      final poll = Poll.fromJson(pollData);

      final dbResult = await _pollsRepository.createPoll(poll);

      if (dbResult.affectedRowCount > 0) {
        return Response.json(
          statusCode: 201,
          body: poll.toJson(),
        );
      } else {
        return Response(statusCode: 400);
      }
    } catch (e) {
      return Response.json(
        statusCode: 500,
        body: {'message': 'An error ocurred while processing this request!'},
      );
    }
  }

  /// Gets a poll by its ID.
  Future<Response> getPollById(String id) async {
    try {
      final dbResult = await _pollsRepository.getPollById(id);

      if (dbResult.isEmpty) {
        return Response.json(
          statusCode: 404,
          body: {'message': 'Poll not found'},
        );
      }
      return Response.json(
        body: dbResult.first.toJson(),
      );
    } catch (e) {
      return Response.json(
        statusCode: 500,
        body: {'message': 'An error ocurred while processing this request!'},
      );
    }
  }

  /// Gets all polls.
  Future<Response> getAllPolls() async {
    try {
      final dbResult = await _pollsRepository.getAllPolls();

      return Response.json(
        body: dbResult.map((e) => e.toJson()).toList(),
      );
    } catch (e) {
      return Response.json(
        statusCode: 500,
        body: {'message': 'An error ocurred while processing this request!'},
      );
    }
  }
}
