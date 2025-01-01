import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_daily/src/features/common/entities/toast.dart';
import 'package:gym_daily/src/features/common/entities/toast_type.dart';
import 'package:toastification/toastification.dart';

void useAsyncErrorToast<T>(
  AsyncSnapshot<T> future, {
  required String Function(Object) builder,
}) {
  final context = useContext();

  final pendingToast = useState<Future<Toast>?>(null);
  final pendingToastFuture = useFuture(pendingToast.value);

  useEffect(
    () {
      final error = future.error;
      final isFutureRunning = future.connectionState == ConnectionState.waiting;

      final didFutureFailed = error != null && !isFutureRunning;

      if (didFutureFailed) {
        pendingToast.value = _presentToast(
          context,
          builder(error),
          type: ToastType.error,
        );
      }

      return;
    },
    [future],
  );

  useEffect(
    () {
      Toast? dismissibleToast;
      if (pendingToastFuture.data case final toast?) {
        dismissibleToast = toast;
      }

      return dismissibleToast?.dismiss;
    },
    [pendingToastFuture],
  );
}

Future<Toast> _presentToast(
  BuildContext context,
  String message, {
  ToastType? type,
}) async {
  final completer = Completer<Toast>();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final toastNotificationItem = toastification.show(
      description: Text(message),
      type: switch (type) {
        ToastType.success => ToastificationType.success,
        ToastType.error => ToastificationType.error,
        _ => null,
      },
      style: ToastificationStyle.flatColored,
    );

    final toast = Toast(toastNotificationItem);
    completer.complete(toast);
  });

  return completer.future;
}
