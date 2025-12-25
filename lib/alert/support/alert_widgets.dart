// alert_widgets.dart -- alert widget creators
// by allen brunson  february 24 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  alert widget creators                                                 ***/
/*                                                                            */
/******************************************************************************/

Widget? alertMessage(BuildContext? context, String? message) {
    return _widget(context, message, alertMessageTextStyle(), 8);
}

Widget? alertTitle(BuildContext? context, String? title) {
    return _widget(context, title, alertTitleTextStyle());
}


/******************************************************************************/
/*                                                                            */
/***  choice widget creators                                                ***/
/*                                                                            */
/******************************************************************************/

Widget? choiceSelection(BuildContext? context, String? title) {
    return _widget(context, title, alertChoiceSelectionTextStyle());
}

Widget? choiceTitle(BuildContext? context, String? title) {
    return _widget(context, title, alertChoiceTitleTextStyle());
}


/******************************************************************************/
/*                                                                            */
/***  alert widget creator                                                  ***/
/*                                                                            */
/******************************************************************************/

Widget? _widget(BuildContext? ctxt, String? text, TextStyle style, [int? lines]) {
    if (stringIsEmpty(text)) return null;
    final view = Text(sanitizeString(text), style:style, maxLines:lines);
    return clipboardText(ctxt, view, showSnackBar:false);
}
