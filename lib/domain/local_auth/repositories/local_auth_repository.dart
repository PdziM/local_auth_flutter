import 'package:dartz/dartz.dart';

import '../../objects/custom_exception.dart';

abstract class LocalAuthUsecase {
  Future<Either<CustomException, bool>> authentication();
}
