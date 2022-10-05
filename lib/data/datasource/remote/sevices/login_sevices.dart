import 'package:itrace_247/data/datasource/remote/api/api.dart';
import 'package:itrace_247/data/datasource/remote/models/request/login_request.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/login_response.dart';
import 'package:retrofit/retrofit.dart';

class LoginServices {
  final Api _api;

  LoginServices(this._api);

  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest) {
    return _api.login(loginRequest);
  }
}
