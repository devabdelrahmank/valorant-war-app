import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/features/agents/data/repo/agents_repo.dart';
import 'package:valorant_war_app/features/agents/presentation/manager/agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit(this.agentsRepo) : super(AgentsInitialState());
  static AgentsCubit get(context) => BlocProvider.of(context);
  final AgentsRepo agentsRepo;

  fetchAgentsData() {
    emit(LoadingFetchdataState());
    var result = agentsRepo.fetchAgentsData();
    result.fold(
      (l) {
        emit(FailureFetchdataState(errMessage: l.errMessage.toString()));
      },
      (r) {
        emit(SuccessFetchdataState(agents: r));
      },
    );
  }
}
