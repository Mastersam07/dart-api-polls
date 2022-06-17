import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:polls_api/services/poll_service.dart';
import 'package:test/test.dart';

import '../../routes/_middleware.dart';

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('middleware', () {
    test('provides greeting (PollsService)', () async {
      PollsService? value;
      final handler = middleware(
        (context) {
          value = context.read<PollsService>();
          return Response(body: '');
        },
      );
      final request = Request.get(Uri.parse('http://localhost/'));
      final context = _MockRequestContext();
      when(() => context.request).thenReturn(request);
      await handler(context);
      expect(value, isNotNull);
    });
  });
}
