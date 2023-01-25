// progress_widget.dart -- progress widget
// by allen brunson  march 20 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  ProgressWidget class                                                  ***/
/*                                                                            */
/******************************************************************************/

class ProgressWidget extends StatefulWidget
{
    // immutable instance variables

    final NetCancelable? netCancelable;
    final String? message;
    final double timeout;

    // constructor

    const ProgressWidget({this.netCancelable, this.message,
     required this.timeout, Key? key}): super(key:key);

    // public instance methods

    @override State<ProgressWidget> createState() {
        return _ProgressWidgetState();
    }
}

class _ProgressWidgetState extends State<ProgressWidget>
{
    // private instance variables

    double _current = 0.0;
    double _start = 0.0;
    double _progressValue = 0.0;
    Timer? _timer;

    // constructor

    _ProgressWidgetState();

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._body();
    }

    @override void dispose() {
        this._timer = cancelPeriodicTimer(this._timer);
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this._current = 0.0;
        this._progressValue = 0.0;
        this._start = currentTime();
        this._timer = periodicTimer(0.25, this._timerProc);
    }

    // private state methods

    Future<void> _cancel() async {
        await this.widget.netCancelable?.cancel();
    }

    double _elapsedTime() {
        return elapsedTime(this._start);
    }

    bool _shouldDisplayProgress() {
        return (this.widget.timeout > 0.0) && (this._current >= 3.0);
    }

    bool _showCancelButton() {
        final data = this.widget.netCancelable;
        if ((data is NetCancelable) == false) return false;
        return data!.allowUserCancel();
    }

    void _timerProc() {
        if (this.widget.timeout <= 0.0) return;
        this.setState((){this._current = this._elapsedTime();});
        this._progressValue = this._current / this.widget.timeout;
    }

    double? _value() {
        if (this._shouldDisplayProgress() == false) return null;
        return this._progressValue;
    }

    // private widget creator methods

    Widget _body() {
        return minimumWidthBox(this._column(), this._bodyWidth());
    }

    double _bodyWidth() {
        final size = screenSize();
        final side = doubleCeil(size.shortestSide * 0.85);
        return min(side, 400.0);
    }

    Widget? _cancelButton() {
        return alertButton(this.context, kCancelTitle, this._cancel);
    }

    Widget _column() {
        final list = this._columnChildren();
        return Column(children:list, mainAxisSize:MainAxisSize.min);
    }

    List<Widget> _columnChildren() {
        final list = <Widget>[];
        if (stringHasLength(this.widget.message)) {
            listAdd(list, this._message());
        }
        listAdd(list, this._progressIndicator());
        if (this._showCancelButton()) {
            listAdd(list, this._cancelButton());
        }
        return list;
    }

    Widget? _message() {
        return alertMessage(this.context, this.widget.message);
    }

    Widget _progressIndicator() {
        final circ = CircularProgressIndicator(value:this._value());
        final cent = Center(child:circ);
        return SizedBox.fromSize(child:cent, size:const Size.square(100.0));
    }
}


/******************************************************************************/
/*                                                                            */
/***  ProgressWidget support functions                                      ***/
/*                                                                            */
/******************************************************************************/

AlertDialog progressAlertDialog(BuildContext? context, String title,
 double timeout, [String? message, NetCancelable? netCancelable])
{
    final text = ellipsis(title);
    final view = ProgressWidget(message:message,
     netCancelable:netCancelable, timeout:timeout);
    return AlertDialog(content:view, title:alertTitle(context, text));
}


/******************************************************************************/
/*                                                                            */
/***  ProgressWidget class                                                  ***/
/*                                                                            */
/******************************************************************************

overview
--------

displays progress for long-running operations. it features up to four fields:

1) title string. required.

2) message string. can be multi-line. if blank, this field won't be displayed.

3) a CircularProgressIndicator that incorporates a timeout. it expects a timeout
in seconds that we are counting down towards. if the specified timeout value is
zero or below, then the behavior is the same as a plain circular progress
indicator. this widget will always be included.

4) if a NetCancelable object is supplied, and it indicates that the user should
be allowed to cancel the operation, then a cancel button will be added. when it
is pressed, it does the obvious thing.


progress indicator notes
------------------------

one of this widget's main functions is to be used during network operations. the
usual case is that a network operation completes in a few seconds or less and
the user goes on with her day. if we get past that initial brief period and the
network operation is still running, then chances are good that it's going to
time out and end in failure.

this widget's circular progress indicator operates in two phases. for the first
few seconds, it displays itself as an indeterminate progress spinner, which
gives the user a lot of jazzy feedback. if we're still going after the honeymoon
period has finished, then it switches from indeterminate to determinate, so the
user will have some visual feedback indicating how long they have to wait before
the agony is over.

*/
