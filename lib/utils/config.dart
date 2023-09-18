import '../domain/local_auth/useCases/local_auth_usecase.dart';
import '../repositories/local_auth/app_local_auth.dart';
import '../repositories/services/local_auth_service.dart';

class Config {
  // SERVICES
  static final localAuthService = newLocalAuthService();
  static final appLocalAuth = newAppLocalAuth(localAuthService);

  // USECASES
  static final localAuthUsecase = newLocalAuthUsecase(appLocalAuth);
}
