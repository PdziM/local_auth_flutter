import 'package:dartz/dartz.dart';
import 'package:local_auth/local_auth.dart';

import '../../domain/objects/custom_exception.dart';
import '../services.dart';

LocalAuthService newLocalAuthService() => _LocalAuthService();

class _LocalAuthService extends LocalAuthService {
  final LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  Future<Either<CustomException, bool>> authenticate() async {
    try {
      bool authenticated = await localAuthentication.authenticate(
          localizedReason: 'Let OS determine authentication method',
          options: const AuthenticationOptions(stickyAuth: true));

      return Right(authenticated);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
