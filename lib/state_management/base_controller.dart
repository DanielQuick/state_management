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
}
