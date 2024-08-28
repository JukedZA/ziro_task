import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/router/route_helper.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

extension WidgetExtension on Widget? {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(
        flex: flex,
        child: this!,
      );

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit}) {
    return Flexible(
      flex: flex,
      fit: fit ?? FlexFit.loose,
      child: this!,
    );
  }

  /// add tap to parent widget
  Widget onTap(
    Function? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      splashFactory: NoSplash.splashFactory,
      splashColor: splashColor ?? Colors.transparent,
      hoverColor: hoverColor ?? Colors.transparent,
      highlightColor: highlightColor ?? Colors.transparent,
      child: this,
    );
  }

  /// Launch a new screen
  Future launch(BuildContext context,
      {bool isNewTask = false, Duration? duration}) async {
    if (isNewTask) {
      return await Navigator.of(context).pushAndRemoveUntil(
        RouteHelper.buildPageRoute(
          child: this!,
          duration: duration,
        ),
        (route) => false,
      );
    } else {
      return await Navigator.of(context).push(
        RouteHelper.buildPageRoute(
          child: this!,
          duration: duration,
        ),
      );
    }
  }
}

extension BuildContextExtension on BuildContext {
  void showSnackBarError(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: ThemeColors.containerOnBackground,
        content: Container(
          decoration: BoxDecoration(
            color: ThemeColors.containerOnBackground,
            borderRadius: BorderRadius.circular(25),
          ),
          child: CustomText(text: message, size: 12),
        ),
      ),
    );
  }
}
