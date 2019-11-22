import 'dart:convert';

class LoginBody {
  String email;
  String password;
  String rememberMe;

  LoginBody({this.email, this.password, this.rememberMe});

  LoginBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    rememberMe = json['remember_me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['remember_me'] = this.rememberMe;
    return data;
  }

  @override
  String toString() =>
      'LoginBody{email: $email, password: $password, rememberMe: $rememberMe}';
}

class Login {
  bool success;
  String message;
  LoginData data;

  Login({
    this.success,
    this.message,
    this.data,
  });

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class LoginData {
  String accessToken;
  String tokenType;
  String expiresAt;

  LoginData({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
  });

  factory LoginData.fromRawJson(String str) =>
      LoginData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        role: json["role"] == null
            ? null
            : List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresAt: json["expires_at"] == null ? null : json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "role": role == null
            ? null
            : List<dynamic>.from(role.map((x) => x.toJson())),
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_at": expiresAt == null ? null : expiresAt,
      };
}