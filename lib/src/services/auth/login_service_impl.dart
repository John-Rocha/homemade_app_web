import '../../core/global/constants.dart';
import './login_service.dart';
import '../../core/storage/session_storage.dart';
import '../../repositories/auth_repository.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository _authRepository;
  final SessionStorage _sessionStorage;

  LoginServiceImpl(
    this._authRepository,
    this._sessionStorage,
  );

  @override
  Future<void> execute(String email, String password) async {
    final authModel = await _authRepository.login(
      email,
      password,
    );

    _sessionStorage.setData(
      SessionStorageKeys.accessToken.key,
      authModel.accessToken,
    );
  }
}
