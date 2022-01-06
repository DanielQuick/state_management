import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management/base_controller_with_ticker.dart';

class BaseViewWithTicker<T extends BaseControllerWithTicker>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T Function(BuildContext, TickerProvider) controllerBuilder;
  const BaseViewWithTicker({
    Key? key,
    required this.builder,
    required this.controllerBuilder,
  }) : super(key: key);

  @override
  _BaseViewWithTickerState<T> createState() => _BaseViewWithTickerState<T>();
}

class _BaseViewWithTickerState<T extends BaseControllerWithTicker>
    extends State<BaseViewWithTicker<T>> with SingleTickerProviderStateMixin {
  late T controller;

  @override
  void initState() {
    controller = widget.controllerBuilder(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T?>(
      create: (context) => controller,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
