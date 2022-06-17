import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:polls_api/services/poll_service.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  final service = context.read<PollsService>();
  if (context.request.method == HttpMethod.get) {
    final resp = await service.getAllPolls();
    return resp;
  }
  if (context.request.method == HttpMethod.post) {
    final requestData = await context.request.json();
    final resp = await service.addPoll(requestData);
    return resp;
  }
  return Response.json(
    statusCode: HttpStatus.methodNotAllowed,
    body: {'message': 'Method not allowed'},
  );
}
