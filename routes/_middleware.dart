import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:polls_api/data/polls_repository_impl.dart';
import 'package:polls_api/database/connection.dart';
import 'package:polls_api/domain/polls_repository.dart';
import 'package:polls_api/services/poll_service.dart';

Handler middleware(Handler handler) {
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load(['.env']);
  final db = DBConnection(dotEnv);
  final pollsRepo = PollsRepositoryImpl(db);

  return handler
      .use(requestLogger())
      .use(provider<DBConnection>((_) => db))
      .use(provider<PollsRepository>((_) => pollsRepo))
      .use(provider<PollsService>((_) => PollsService(pollsRepo)));
}
