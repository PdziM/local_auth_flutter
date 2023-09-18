import 'package:dartz/dartz.dart';

import '../../domain/objects/custom_exception.dart';
import '../app_local_auth.dart';
import '../services.dart';

AppLocalAuth newAppLocalAuth(LocalAuthService service) =>
    _AppLocalAuth(service);

class _AppLocalAuth extends AppLocalAuth {
  final LocalAuthService _service;

  _AppLocalAuth(this._service);

  @override
  Future<Either<CustomException, bool>> authentication() async {
    final res = await _service.authenticate();
    return res.fold(Left.new, (r) => Right(r));
  }
}
