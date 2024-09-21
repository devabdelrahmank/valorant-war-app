import 'package:valorant_war_app/features/maps/data/model/maps_model.dart';

abstract class MapsState {}

class MapsInitialState extends MapsState {}

class LoadingFetchdataState extends MapsState {}

class SuccessFetchdataState extends MapsState {
  final Maps maps;
  SuccessFetchdataState({required this.maps});
}

class FailureFetchdataState extends MapsState {
  final String errMessage;
  FailureFetchdataState({required this.errMessage});
}
