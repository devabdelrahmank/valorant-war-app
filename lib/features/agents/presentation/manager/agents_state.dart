import 'package:valorant_war_app/features/agents/data/model/agents_model.dart';

abstract class AgentsState {}

class AgentsInitialState extends AgentsState {}

class LoadingFetchdataState extends AgentsState {}

class SuccessFetchdataState extends AgentsState {
  final Agents agents;

  SuccessFetchdataState({required this.agents});
}

class FailureFetchdataState extends AgentsState {
  final String errMessage;

  FailureFetchdataState({required this.errMessage});
}
