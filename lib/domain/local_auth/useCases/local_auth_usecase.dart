import 'package:dartz/dartz.dart';

import '../../../repositories/app_local_auth.dart';
import '../../objects/custom_exception.dart';
import '../repositories/local_auth_repository.dart';

LocalAuthUsecase newLocalAuthUsecase(AppLocalAuth appLocalAuth) =>
    _LocalAuthUsecase(appLocalAuth);

class _LocalAuthUsecase extends LocalAuthUsecase {
  final AppLocalAuth _appLocalAuth;

  _LocalAuthUsecase(this._appLocalAuth);

  @override
  Future<Either<CustomException, bool>> authentication() async {
    final res = await _appLocalAuth.authentication();
    return res.fold(Left.new, (r) => Right(r));
  }
}
