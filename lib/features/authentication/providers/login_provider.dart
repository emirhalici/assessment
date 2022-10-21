import 'package:assessment/core/service/network_service.dart';
import 'package:assessment/features/authentication/model/login_model.dart';
import 'package:assessment/features/authentication/state/login_state.dart';
import 'package:assessment/product/providers/services/network_provider.dart';
import 'package:assessment/product/utils/endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<LoginState> {
  final INetworkService _networkService;

  LoginProvider(this._networkService) : super(LoginStateInitial());

  Future<void> attemptLogin(String username, String password) async {
    state = LoginStateLoading();

    final response = await _networkService.postMethod<LoginModel>(
      path: Endpoints.postLogin(username, password),
      body: null,
      queryParameter: null,
      fromMap: (object) => LoginModel.fromMap(object as Map<String, dynamic>),
    );

    final isOk = response.model?.status == 'ok';

    if (response.status || isOk) {
      state = LoginStateSuccess(cookie: response.model!.cookie!);
    } else {
      final errorMessage = response.errorMessage ?? response.model?.error;

      state = LoginStateError(
        errorMessage: errorMessage ?? 'Unexpected error while login',
      );
    }
  }
}

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  return LoginProvider(ref.watch(networkProvider));
});
