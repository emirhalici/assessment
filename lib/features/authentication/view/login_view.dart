import 'package:assessment/features/authentication/providers/login_provider.dart';
import 'package:assessment/features/authentication/state/login_state.dart';
import 'package:assessment/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next is LoginStateSuccess) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: passwordController,
          ),
          TextButton(
            onPressed: () {
              final username = usernameController.text;
              final password = passwordController.text;
              ref.read(loginProvider.notifier).attemptLogin(username, password);
            },
            child: const Text('Attempt login'),
          ),
          Consumer(builder: (_, ref, __) {
            final state = ref.watch(loginProvider);

            if (state is LoginStateLoading) {
              return const CircularProgressIndicator.adaptive();
            }

            if (state is LoginStateError) {
              return buildErrorWidget(state, ref);
            }

            if (state is LoginStateSuccess) {
              return const Text('Success');
            }

            return const SizedBox();
          }),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Column buildErrorWidget(LoginStateError state, WidgetRef ref) {
    return Column(
      children: [
        Text(state.errorMessage),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // final username = usernameController.text;
            // final password = passwordController.text;
            // ref.read(loginProvider.notifier).attemptLogin(username, password);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeView(),
                ));
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
