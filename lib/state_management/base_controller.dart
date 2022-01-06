import 'package:flutter/material.dart';

class BaseController extends ChangeNotifier {
  final BuildContext context;

  bool disposed = false;

  BaseController(this.context);

  @override
  dispose() {
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
