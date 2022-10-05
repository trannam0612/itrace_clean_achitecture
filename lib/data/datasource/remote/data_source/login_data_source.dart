import 'package:itrace_247/data/datasource/remote/models/request/login_request.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/login_response.dart';
import 'package:itrace_247/data/datasource/remote/sevices/login_sevices.dart';
import 'package:retrofit/retrofit.dart';

class LoginDataSource {
  final LoginServices _loginServices;

  LoginDataSource(this._loginServices);

  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest) {
    return _loginServices.login(loginRequest);
  }
}
