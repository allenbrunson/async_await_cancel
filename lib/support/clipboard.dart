// clipboard.dart -- widget clipboard support
// by allen brunson  june 17 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  public clipboard functions                                            ***/
/*                                                                            */
/******************************************************************************/

Widget clipboardText(BuildContext? context, Text textWidget,
 {bool scroll = false, bool showSnackBar = true})
{
    final text = textWidgetString(textWidget);
    return clipboardWidget(context, textWidget, text,
     scroll:scroll, showSnackBar:showSnackBar);
}

Widget clipboardWidget(BuildContext? context, Widget child, String text,
 {bool scroll = false, bool showSnackBar = true})
{
    final proc = (){copyToClipboard(context, text, showSnackBar:showSnackBar);};
    final view = _scroll(child, scroll);
    return GestureDetector(child:view, onLongPress:proc);
}

void copyToClipboard(BuildContext? context, String text,
 {bool showSnackBar = true})
{
    Clipboard.setData(ClipboardData(text:text));
    if (showSnackBar && (context is BuildContext)) {
        const view = Text("copied to clipboard");
        final sbar = SnackBar(content:view, duration:durationAnimate());
        ScaffoldMessenger.of(context).showSnackBar(sbar);
    }
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

Widget _scroll(Widget child, bool scroll) {
    if (scroll == false) return child;
    return SingleChildScrollView(child:child);
}


/******************************************************************************/
/*                                                                            */
/***  clipboard functions                                                   ***/
/*                                                                            */
/******************************************************************************

overview
--------

wrapper functions that allow widgets to have their text content copied to the
clipboard when the user long-presses on them.

*/
