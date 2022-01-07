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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.controllerBuilder(context, this),
      builder: (context, child) {
        final controller = Provider.of<T>(context);
        return widget.builder(context, controller, child);
      },
    );
  }
}
