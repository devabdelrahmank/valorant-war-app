import 'package:valorant_war_app/features/wepons/data/model/wepons/wepons.dart';

abstract class WeponsStates {}

class WeponsInitialState extends WeponsStates {}

class LoadingFetchdataState extends WeponsStates {}

class SuccessFetchWepondataState extends WeponsStates {
  final Wepons wepons;

  SuccessFetchWepondataState({required this.wepons});
}

class FailureFetchWepondataState extends WeponsStates {
  final String errMessage;

  FailureFetchWepondataState({required this.errMessage});
}
