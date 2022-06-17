import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:polls_api/services/poll_service.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final service = context.read<PollsService>();
  if (context.request.method == HttpMethod.get) {
    final resp = await service.getPollById(id);

    return resp;
  }
  return Response.json(
    statusCode: HttpStatus.methodNotAllowed,
    body: {'message': 'Method not allowed'},
  );
}
