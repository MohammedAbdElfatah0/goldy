import 'package:goldy/features/gold/data/models/gold_model.dart';

abstract class GoldState {}

class GoldInitialCubit extends GoldState {}

class GoldLoadingCubit extends GoldState {}

class GoldSuccessCubit extends GoldState {
  final GoldModel goldModel;
  GoldSuccessCubit({required this.goldModel});
}

class GoldFailureCubit extends GoldState {
  final String errorMessage;
  
  
  GoldFailureCubit({required this.errorMessage});
}
