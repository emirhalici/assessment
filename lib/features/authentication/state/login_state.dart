// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginState {}

class LoginStateInitial implements LoginState {}

class LoginStateLoading implements LoginState {}

class LoginStateSuccess implements LoginState {
  String cookie;
  LoginStateSuccess({
    required this.cookie,
  });
}

class LoginStateError implements LoginState {
  String errorMessage;
  LoginStateError({
    required this.errorMessage,
  });
}
