class LoginEntity {
  LoginEntity({
    this.status,
    this.message,
    this.loginData,
  });

  int? status;

  String? message;

  LoginData? loginData;
}

class LoginData {
  LoginData({
    this.token,
    this.refreshToken,
  });
  String? token;

  String? refreshToken;
}
