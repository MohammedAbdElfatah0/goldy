import 'package:goldy/features/silver/data/models/silver_model.dart';

abstract class SilverState {}

class SilverInitialCubit extends SilverState {}

class SilverLoadingCubit extends SilverState {}

class SilverSuccessCubit extends SilverState {
  final SilverModel silverModel;
  SilverSuccessCubit({required this.silverModel});
}

class SilverFailureCubit extends SilverState {
  final String errorMessage;
  
  
  SilverFailureCubit({required this.errorMessage});
}
