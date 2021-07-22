import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management/base_controller.dart';
import 'package:state_management/state_management/locator.dart';

class BaseView<T extends BaseController> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onControllerReady;
  final BuildContext context;
  BaseView(
      {required this.builder, this.onControllerReady, required this.context});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseController> extends State<BaseView<T>> {
  T controller = locator<T>();

  @override
  void initState() {
    controller.context = widget.context;
    controller.onCreate();
    if (widget.onControllerReady != null) {
      widget.onControllerReady!(controller);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => controller,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
