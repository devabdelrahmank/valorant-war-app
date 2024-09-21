import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/features/wepons/data/repo/wepon_repo.dart';
import 'package:valorant_war_app/features/wepons/presentation/manager/wepons_states.dart';

class WeponsCubit extends Cubit<WeponsStates> {
  WeponsCubit(this.weponRepoImpl) : super(WeponsInitialState());
  static WeponsCubit get(context) => BlocProvider.of(context);
  final WeponRepo weponRepoImpl;

  fetchWeponsData() {
    emit(LoadingFetchdataState());
    var result = weponRepoImpl.fetchWeponsData();
    result.fold(
      (l) {
        emit(FailureFetchWepondataState(errMessage: l.errMessage.toString()));
      },
      (r) {
        emit(SuccessFetchWepondataState(wepons: r));
      },
    );
  }
}
