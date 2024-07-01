import 'package:flutter_styled_toast/flutter_styled_toast.dart';


// Toast
void Toast(String msg) {
  showToast(msg,
      position: StyledToastPosition.bottom,
      toastHorizontalMargin: 50,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      duration: const Duration(seconds: 2));
}
