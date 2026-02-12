import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constant.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/core/networking/network_service.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGoldInfo() async {
    try {
      // Check connectivity first
      if (!await NetworkService.isConnected()) {
        return const Left(
          'No internet connection. Please check your network settings.',
        );
      }

      final res = await DioHelper.getData(url: ApiConstant.getInfoGold);
      return Right(GoldModel.fromJson(res.data));
    } on DioException catch (e) {
      if (e.error == 'No internet connection') {
        return const Left(
          'No internet connection. Please check your network settings.',
        );
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return const Left('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return const Left('Server response timeout. Please try again.');
      } else if (e.response?.statusCode == 404) {
        return const Left('Data not found. Please try again later.');
      } else if (e.response?.statusCode == 500) {
        return const Left('Server error. Please try again later.');
      } else {
        return Left('Network error: ${e.message}');
      }
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }
}
