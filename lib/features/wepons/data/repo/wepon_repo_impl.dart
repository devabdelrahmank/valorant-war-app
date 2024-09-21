import 'package:either_dart/src/either.dart';
import 'package:valorant_war_app/core/errors/error_exception.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/core/servise/api_consumer.dart';
import 'package:valorant_war_app/core/servise/end_points.dart';
import 'package:valorant_war_app/features/wepons/data/model/wepons/wepons.dart';
import 'package:valorant_war_app/features/wepons/data/repo/wepon_repo.dart';

class WeponRepoImpl extends WeponRepo {
  final ApiConsumer api;
  WeponRepoImpl({
    required this.api,
  });
  @override
  Future<Either<Failure, Wepons>> fetchWeponsData() async {
    try {
      var response = await api.get(
        EndPoints.endPointWeapons,
      );
      return Right(Wepons.fromJson(response));
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
