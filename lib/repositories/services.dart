import 'package:dartz/dartz.dart';

import '../domain/objects/custom_exception.dart';

abstract class LocalAuthService {
  Future<Either<CustomException, bool>> authenticate();
}
