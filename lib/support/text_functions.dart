// text_functions.dart -- text widget support functions
// by allen brunson  september 18 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  text widget support functions                                         ***/
/*                                                                            */
/******************************************************************************/

String textWidgetString(Text text) {
    final data = text.data;
    final span = text.textSpan;
    if ((data is String) && data.isNotEmpty) return data;
    if (span is TextSpan) return span.toPlainText(includeSemanticsLabels:false);
    return emptyString();
}
