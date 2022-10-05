import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/core/usecases/usecase.dart';
import 'package:itrace_247/domain/entities/login_entity.dart';
import 'package:itrace_247/domain/repositories/login_reposetory.dart';

class LoginUsecase implements UseCase<DataState<LoginEntity>, String?> {
  LoginUsecase(this._loginRepository);
  final LoginRepository _loginRepository;

  @override
  Future<DataState<LoginEntity>> call({String? params}) {
    return _loginRepository.login();
  }
}
