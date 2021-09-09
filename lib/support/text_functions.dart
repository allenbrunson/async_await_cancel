// text_functions.dart -- text widget support functions
// by allen brunson  september 18 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  text widget support functions                                         ***/
/*                                                                            */
/******************************************************************************/

String textWidgetString(Text text) {
    if ((text.data is String) && text.data!.isNotEmpty) {
        return text.data!;
    }
    if (text.textSpan is TextSpan) {
        return text.textSpan!.toPlainText(includeSemanticsLabels:false);
    }
    return "";
}
