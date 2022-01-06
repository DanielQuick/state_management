import 'package:flutter/cupertino.dart';

class BaseChangeNotifierProvider with ChangeNotifier {
  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
