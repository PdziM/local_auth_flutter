import 'package:dartz/dartz.dart';

import '../domain/objects/custom_exception.dart';

abstract class AppLocalAuth {
  Future<Either<CustomException, bool>> authentication();
}
