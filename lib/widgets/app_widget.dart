// app_widget.dart -- main app widget
// by allen brunson  august 17 2021

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  AppWidget class                                                       ***/
/*                                                                            */
/******************************************************************************/

class AppWidget extends StatelessWidget
{
    // constructor

    const AppWidget({super.key});

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._materialApp();
    }

    // private instance methods

    MaterialApp _materialApp() {
        final text = appTitle();
        final view = HomeWidget(title:text);
        return MaterialApp(debugShowCheckedModeBanner:false, home:view,
         theme:this._themeData(), title:text);
    }

    ThemeData _themeData() {
        return ThemeData(primarySwatch:Colors.amber);
    }
}


/******************************************************************************/
/*                                                                            */
/***  AppWidget support functions                                           ***/
/*                                                                            */
/******************************************************************************/

String appTitle() {
    return "Async/Await Cancel Demo";
}
