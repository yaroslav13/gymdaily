import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_daily/src/features/common/gym_daily_edge_insets.dart';
import 'package:gym_daily/src/providers/login/login_form_state_provider.dart';
import 'package:gym_daily/src/resources/translations.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(loginFormStateProvider);

    final pendingLogIn = useState<Future<void>?>(null);

    final logInSnapshot = useFuture(pendingLogIn.value);

    useEffect(
      () {
        final didLoginFail = logInSnapshot.hasError &&
            logInSnapshot.connectionState != ConnectionState.waiting;

        if (didLoginFail) {
          // TODO: Show snackbar
        }

        return;
      },
      [logInSnapshot],
    );

    return Scaffold(
      body: Form(
        child: Padding(
          padding: const GymDailyEdgeInsets.bodyInsets(),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              TextFormField(
                decoration: const InputDecoration()
                    .copyWith(labelText: context.t.email),
                onChanged:
                    ref.read(loginFormStateProvider.notifier).onEmailChanged,
              ),
              TextFormField(
                decoration: const InputDecoration()
                    .copyWith(labelText: context.t.password),
                onChanged:
                    ref.read(loginFormStateProvider.notifier).onPasswordChanged,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: formState.isValid ? () {} : null,
                child: Text(context.t.logIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
