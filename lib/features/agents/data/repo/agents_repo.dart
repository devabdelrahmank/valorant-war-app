import 'package:either_dart/either.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/features/agents/data/model/agents_model.dart';

abstract class AgentsRepo {
  Future<Either<Failure, Agents>> fetchAgentsData();
}
