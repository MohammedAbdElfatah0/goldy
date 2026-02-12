import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constant.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGoldInfo() async {
    try {
      final res = await DioHelper.getData(url: ApiConstant.getInfoGold);

      return Right(GoldModel.fromJson(res.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
