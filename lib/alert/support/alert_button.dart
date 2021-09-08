// alert_button.dart -- alert button creators
// by allen brunson  february 24 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  alert button creators                                                 ***/
/*                                                                            */
/******************************************************************************/

Widget? alertButton(BuildContext? context, String title, VoidCallback proc) {
    if (title.isEmpty) return null;
    if ((context is BuildContext) == false) return null;
    final text = title.toUpperCase();
    final view = Text(text, style:alertButtonTextStyle());
    return TextButton(child:view, onPressed:proc, style:_buttonStyle(context!));
}

Widget? alertChoiceButton(BuildContext? context, String title, dynamic value) {
    if (title.isEmpty) return null;
    if ((context is BuildContext) == false) return null;
    final proc = (){Navigator.of(context!).pop(value);};
    return alertButton(context, title, proc);
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

ButtonStyle _buttonStyle(BuildContext context) {
    final back = Theme.of(context).accentColor;
    final fore = textColor(context, back);
    return TextButton.styleFrom(primary:fore, backgroundColor:back);
}
