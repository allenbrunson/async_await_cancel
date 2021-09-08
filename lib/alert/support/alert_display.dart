// alert_display.dart -- show and hide alert dialogs
// by allen brunson  february 24 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  show and hide alert dialogs                                           ***/
/*                                                                            */
/******************************************************************************/

// hide any kind of alert. for general-purpose use.

void hideAlert(BuildContext? context) {
    if (context is BuildContext) Navigator.of(context).pop();
}

// wrapper around showDialog() to make it more usable. this method is pretty
// low-level, intended for use by other alert modules. to display an alert, you
// will want to look at higher-level alert modules.

Future<T?> showAlertWidget<T>(BuildContext? ctxt, Widget widget) async {
    if ((ctxt is BuildContext) == false) return null;
    final proc = (_){return widget;};
    return showDialog<T>(barrierDismissible:false, builder:proc, context:ctxt!);
}
