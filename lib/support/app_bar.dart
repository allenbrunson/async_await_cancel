// app_bar.dart -- app bar widget creator
// by allen brunson  december 8 2018

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  public AppBar functions                                               ***/
/*                                                                            */
/******************************************************************************/

PreferredSizeWidget appBar(BuildContext context, String title, [Widget? leading,
 List<Widget>? actions, VoidCallback? proc])
{
    final abar = _appBar(context, title, leading, actions);
    final size = Size.fromHeight(appBarHeight());
    final wrap = _appBarWrapper(abar, proc);
    return PreferredSize(child:wrap, preferredSize:size);
}

double appBarHeight() {
    return 50.0;
}

Widget scaffold(BuildContext context, PreferredSizeWidget appBar, Widget body) {
    final colr = Theme.of(context).backgroundColor;
    return Scaffold(appBar:appBar, body:body, backgroundColor:colr);
}

Widget simpleScaffold(BuildContext context, String title, Widget body) {
    return scaffold(context, appBar(context, title), body);
}


/******************************************************************************/
/*                                                                            */
/***  private AppBar functions                                              ***/
/*                                                                            */
/******************************************************************************/

AppBar _appBar(BuildContext context, String title, Widget? lead,
 List<Widget>? actions)
{
    final view = Text(title);
    return AppBar(actions:actions, centerTitle:true, leading:lead, title:view);
}

Widget _appBarWrapper(AppBar appBar, VoidCallback? proc) {
    if (proc == null) return appBar;
    return GestureDetector(child:appBar, onTap:proc);
}
