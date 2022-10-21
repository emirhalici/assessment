// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String status;
  String? cookie;
  String? error;
  LoginModel({
    required this.status,
    this.cookie,
    this.error,
  });

  LoginModel copyWith({
    String? status,
    String? cookie,
    String? error,
  }) {
    return LoginModel(
      status: status ?? this.status,
      cookie: cookie ?? this.cookie,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'cookie': cookie,
      'error': error,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] as String,
      cookie: map['cookie'] != null ? map['cookie'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(status: $status, cookie: $cookie, error: $error)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.cookie == cookie && other.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ cookie.hashCode ^ error.hashCode;
}
