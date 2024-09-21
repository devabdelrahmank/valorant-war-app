// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:valorant_war_app/core/errors/error_exception.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/core/servise/api_consumer.dart';
import 'package:valorant_war_app/core/servise/end_points.dart';
import 'package:valorant_war_app/features/agents/data/model/agents_model.dart';
import 'package:valorant_war_app/features/agents/data/repo/agents_repo.dart';

class AgentsRepoImpl extends AgentsRepo {
  final ApiConsumer api;
  AgentsRepoImpl({
    required this.api,
  });

  @override
  Future<Either<Failure, Agents>> fetchAgentsData() async {
    try {
      var response = await api.get(
        EndPoints.endPointAgents,
      );
      return Right(Agents.fromJson(response));
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
