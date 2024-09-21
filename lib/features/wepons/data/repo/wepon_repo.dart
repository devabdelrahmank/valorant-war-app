import 'package:either_dart/either.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/features/wepons/data/model/wepons/wepons.dart';

abstract class WeponRepo {
  Future<Either<Failure, Wepons>> fetchWeponsData();
}
