import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/features/maps/data/repo/maps_repo.dart';
import 'package:valorant_war_app/features/maps/presentation/manager/maps_states.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit(this.mapsRepo) : super(MapsInitialState());
  static MapsCubit get(context) => BlocProvider.of(context);
  final MapsRepo mapsRepo;

  fetchMapsData() {
    emit(LoadingFetchdataState());
    var result = mapsRepo.fetchMapsData();
    result.fold(
      (l) {
        emit(FailureFetchdataState(errMessage: l.errMessage.toString()));
      },
      (r) {
        emit(SuccessFetchdataState(maps: r));
      },
    );
  }
}
