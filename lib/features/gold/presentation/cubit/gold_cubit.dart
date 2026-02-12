import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';

import 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;
  GoldCubit({required this.goldRepo}) : super(GoldInitialCubit());
  Future<void> getGoldInfo() async {
    emit(GoldLoadingCubit());
    final res = await goldRepo.getGoldInfo();
    res.fold((error) {
      emit(GoldFailureCubit(errorMessage: error));
    }, (goldModel) => emit(GoldSuccessCubit(goldModel: goldModel)));
  }
}
