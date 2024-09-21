// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';

import 'package:valorant_war_app/core/errors/error_exception.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/core/servise/api_consumer.dart';
import 'package:valorant_war_app/core/servise/end_points.dart';
import 'package:valorant_war_app/features/maps/data/model/maps_model.dart';
import 'package:valorant_war_app/features/maps/data/repo/maps_repo.dart';

class MapsRepoImpl extends MapsRepo {
  final ApiConsumer api;
  MapsRepoImpl({
    required this.api,
  });
  @override
  Future<Either<Failure, Maps>> fetchMapsData() async {
    try {
      var response = await api.get(
        EndPoints.endPointMaps,
      );
      return Right(Maps.fromJson(response));
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
