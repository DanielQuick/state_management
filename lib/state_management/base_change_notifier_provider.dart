import 'package:flutter/cupertino.dart';

class BaseChangeNotifierProvider with ChangeNotifier {
  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  addListener(VoidCallback listener) {
    if (disposed) return;

    super.addListener(listener);
  }

  @override
  removeListener(VoidCallback listener) {
    if (disposed) return;

    super.addListener(listener);
  }

  @override
  void notifyListeners() {
    if (disposed) return;
    super.notifyListeners();
  }
}
