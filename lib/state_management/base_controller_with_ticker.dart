import 'package:flutter/material.dart';
import 'package:state_management/state_management/base_controller.dart';

class BaseControllerWithTicker extends BaseController {
  final TickerProvider tickerProvider;
  BaseControllerWithTicker(BuildContext context, this.tickerProvider)
      : super(context);
}
