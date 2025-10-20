// home_widget -- first page widget
// by allen brunson  august 17 2021

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  HomeWidget class                                                      ***/
/*                                                                            */
/******************************************************************************/

class HomeWidget extends StatefulWidget
{
    // final instance variables

    final String title;

    // constructor

    const HomeWidget({required this.title, super.key});

    // public instance methods

    @override State<HomeWidget> createState() {
        return _HomeWidgetState();
    }
}

class _HomeWidgetState extends State<HomeWidget>
{
    // public instance methods

    @override Widget build(BuildContext context) {
        return orientationWidget(this._body);
    }

    // button press functions

    Future<void> _awaitPlain() async {
        await this._netRequest(allowUserCancel:false);
    }

    Future<void> _awaitWithCancel() async {
        await this._netRequest(allowUserCancel:true);
    }

    // network request functions

    Future<void> _netRequest({bool allowUserCancel = true}) async {
        final resp = await showNetRequest(this.context, "Network Request",
         "something is happening", this._netRequestProc,
         allowUserCancel:allowUserCancel);
        showNetAlert(this.context, resp);
    }

    Future<NetResponse> _netRequestProc() async {
        await waitForDelay(5.0);
        return NetResponse.successfulRequest();
    }

    // private widget creators

    Widget _body() {
        final text = this.widget.title;
        return simpleScaffold(this.context, text, this._bodyInner());
    }

    Widget _bodyInner() {
        const colr = Colors.grey;
        final view = SafeArea(child:this._surface());
        return backgroundColorWidget(view, colr);
    }

    Widget _buttonColumn() {
        return Column(children:this._buttonList(),
         crossAxisAlignment:CrossAxisAlignment.center,
         mainAxisAlignment:MainAxisAlignment.center,
         mainAxisSize:MainAxisSize.max);
    }

    List<Widget> _buttonList() {
        final list = <Widget>[];
        list.add(button("Await, Cancel Disabled", this._awaitPlain));
        list.add(button("Await, Cancel Enabled", this._awaitWithCancel));
        return list;
    }

    Widget _surface() {
        return Center(child:this._buttonColumn());
    }
}
