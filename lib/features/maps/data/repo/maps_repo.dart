import 'package:either_dart/either.dart';
import 'package:valorant_war_app/core/errors/failure.dart';
import 'package:valorant_war_app/features/maps/data/model/maps_model.dart';

abstract class MapsRepo {
  Future<Either<Failure, Maps>> fetchMapsData();
}
