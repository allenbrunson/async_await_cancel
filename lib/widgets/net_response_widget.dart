// net_response_widget.dart -- NetResponse display widget
// by allen brunson  september 12 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  NetResponseWidget class                                               ***/
/*                                                                            */
/******************************************************************************/

class NetResponseWidget extends StatelessWidget
{
    // immutable instance variables

    final NetResponse netResponse;

    // constructor

    const NetResponseWidget({required this.netResponse,
     Key? key}): super(key:key);

    // public functions

    @override Widget build(BuildContext context) {
        return this._body(context);
    }

    // private widget creator functions

    Widget _body(BuildContext context) {
        return scrollWidget(this._column(context));
    }

    Column _column(BuildContext context) {
        return Column(children:this._columnChildren(context),
         crossAxisAlignment:CrossAxisAlignment.start,
         mainAxisAlignment:MainAxisAlignment.start,
         mainAxisSize:MainAxisSize.min);
    }

    List<Widget> _columnChildren(BuildContext context) {
        final list = <Widget>[];
        list.add(this._message(context));
        list.add(this._status(context));
        return list;
    }

    Widget _message(BuildContext context) {
        final text = trimString(this.netResponse.errorString);
        return this._messageText(context, text);
    }

    Widget _messageText(BuildContext context, String text) {
        final view = Text(text, maxLines:8);
        return clipboardText(context, view, showSnackBar:false);
    }

    Widget _status(BuildContext context) {
        final code = this.netResponse.statusCode;
        final text = "status code: ${code}";
        final view = Text("\n${text}");
        return clipboardText(context, view, showSnackBar:false);
    }
}


/******************************************************************************/
/*                                                                            */
/***  NetResponseWidget support functions                                   ***/
/*                                                                            */
/******************************************************************************/

AlertDialog netResponseAlertDialog(BuildContext? ctxt, NetResponse response) {
    final list = <Widget>[];
    final titl = alertTitle(ctxt, response.title);
    final view = NetResponseWidget(netResponse:response);
    listAdd(list, alertChoiceButton(ctxt, kOkayTitle, DialogButton.okay));
    return AlertDialog(actions:list, content:view, title:titl);
}


/******************************************************************************/
/*                                                                            */
/***  NetResponseWidget class                                               ***/
/*                                                                            */
/******************************************************************************

overview
--------

displays the contents of a NetResponse object. used in an alert that is
displayed to the user when a network operation fails.

*/
