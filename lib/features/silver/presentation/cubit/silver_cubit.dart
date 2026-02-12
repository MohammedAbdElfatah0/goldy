import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/silver/data/repo/silver_repo.dart';

import 'silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;
  SilverCubit({required this.silverRepo}) : super(SilverInitialCubit());
  Future<void> getSilverInfo() async {
    emit(SilverLoadingCubit());
    final res = await silverRepo.getSilverInfo();
    res.fold((error) {
      emit(SilverFailureCubit(errorMessage: error));
    }, (silverModel) => emit(SilverSuccessCubit(silverModel: silverModel)));
  }
}
