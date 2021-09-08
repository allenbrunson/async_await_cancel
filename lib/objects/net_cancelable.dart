// net_cancelable.dart -- network cancelable operation
// by allen brunson  september 22 2019

import "package:async/async.dart";
import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  NetCancelable class                                                   ***/
/*                                                                            */
/******************************************************************************/

class NetCancelable
{
    // constructor

    NetCancelable(NetResponseProc proc, {bool allowUserCancel = false}) {
        this._allowUserCancel = allowUserCancel;
        this._completer = this._makeCompleter();
        this._netResponseProc = proc;
    }

    // public instance methods

    void cancel() {
        this._completer.operation.cancel();
    }

    Future<NetResponse> complete() async {
        final fail = this._fail();
        this._completer.complete(this._netResponseProc());
        if (this._completer.isCanceled) return fail;
        final data = await this._completer.operation.valueOrCancellation(fail);
        if (isNetResponse(data)) return (data as NetResponse);
        return fail;
    }

    // allowUserCancel property

    bool allowUserCancel() {
        return this._allowUserCancel;
    }

    void setAllowUserCancel(bool allowUserCancel) {
        this._allowUserCancel = allowUserCancel;
    }

    // private instance methods

    FutureOr<NetResponse> _cancel() async {
        return this._fail();
    }

    NetResponse _fail() {
        return NetResponse.canceledRequest();
    }

    CancelableCompleter<NetResponse> _makeCompleter() {
        return CancelableCompleter<NetResponse>(onCancel:this._cancel);
    }

    // private instance variables

    bool _allowUserCancel = false;
    late CancelableCompleter<NetResponse> _completer;
    late NetResponseProc _netResponseProc;
}


/******************************************************************************/
/*                                                                            */
/***  NetCancelable class                                                   ***/
/*                                                                            */
/******************************************************************************

overview
--------

allows end users to cancel a network request.

this object has a convenience bool property, allowUserCancel, which is not used
internally. this is for cases where you want to use a NetCancelable object even
when the user is not allowed to be the one doing the cancelling. for example,
you might want to cancel because the user switched away from the app.


how to use this module
----------------------

1) write a NetResponseProc that performs your network operation, and returns a
NetResponse at the end.

2) create a NetCancelable object with the NetResponseProc.

3) pass the NetCancelable object to a progress widget that will be displayed
during the network operation. display the widget as a modal alert with a cancel
button.

4) once the modal widget is displayed onscreen, call NetCancelable.complete(),
which will run the network operation to completion and return a NetResponse.

5) the network request is now complete. dismiss the modal widget and deal with
the NetResponse as usual.

6) if the user wants to cancel, or the user switches away from the app, the
progress widget should call NetCancelable.cancel(), which will cause step four
to abort prematurely.

7) if you need to know if the operation was canceled, NetResponse.canceled()
will give you the answer. if true, the operation was canceled, and there will
be no network data to operate on.


maintenance notes
-----------------

the good news is that CancelableCompleter achieves what initially seemed
impossible: it can abruptly and immediately abort a function that returns a
Future<T>. the bad news is that the way it works is frustrating,
counter-intuitive, and almost completely undocumented. it is not much of a
surprise that it is not widely used in the dart community.

i had to fiddle with this thing for many days to get it to work. one thing i can
now say for sure: i have no idea how async/await is implemented under the hood.
at every turn, my instincts failed me.

here is one detail that seems instructive. the final piece that fell into place
was calling valueOrCancellation() at the end of complete(). if you just return
the raw value, which is what i did previously (because that's what i saw in what
few examples i could dig up), but the operation is cancelled, then complete()
will never return. yep, that's right: it never returns. any code placed after
the complete call, at the end of a function say, will never be run. i don't
understand how that is even possible, but that's what happens.

suffice to say, i consider this entire module to be raw unmitigated black-magic
voodoo. if you change even one byte of this code, you better be prepared to do a
full round of tests to make sure you didn't break anything.


further reading
---------------

  https://pub.dev/packages/async
  https://stackoverflow.com/questions/53738505
  https://stackoverflow.com/questions/17552757

*/
