// net_alert.dart -- network alert functions
// by allen brunson  february 24 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  network alert functions                                               ***/
/*                                                                            */
/******************************************************************************/

void showNetAlert(BuildContext? context, NetResponse response) {
    unawaited(showAlertWidget(context, netResponseAlertDialog(context, response)));
}

Future<NetResponse> showNetRequest(BuildContext? ctxt, String title,
 String message, NetResponseProc proc, {bool allowUserCancel = false,
 bool showFailure = false, double? timeout = null}) async
{
    if ((ctxt is BuildContext) == false) return proc();
    final data = NetCancelable(proc, allowUserCancel:allowUserCancel);
    final tval = NetPrefs.timeout(timeout);
    final view = progressAlertDialog(ctxt, title, tval, message, data);
    unawaited(showAlertWidget(ctxt, view));
    final resp = await data.complete();
    hideAlert(ctxt);
    if (showFailure && resp.failedButNotCanceled()) showNetAlert(ctxt, resp);
    return resp;
}
