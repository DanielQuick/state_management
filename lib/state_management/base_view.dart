import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management/base_controller.dart';

class BaseView<T extends BaseController> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T Function(BuildContext) controllerBuilder;
  BaseView({
    required this.builder,
    required this.controllerBuilder,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseController> extends State<BaseView<T>> {
  late T controller;

  @override
  void initState() {
    controller = widget.controllerBuilder(context);
    super.initState();
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
