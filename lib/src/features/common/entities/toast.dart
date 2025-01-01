import 'package:toastification/toastification.dart';

extension type Toast(ToastificationItem toast) {
  void dismiss() {
    toastification.dismiss(toast);
  }
}
