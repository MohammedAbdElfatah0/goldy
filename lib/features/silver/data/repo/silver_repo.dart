import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constant.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilverInfo() async {
    try {
      final res = await DioHelper.getData(url: ApiConstant.getInfoSilver);

      return Right(SilverModel.fromJson(res.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
