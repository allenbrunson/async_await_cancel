// widget_wrappers.dart -- widget wrapper functions
// by allen brunson  august 18 2021

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  module defines                                                        ***/
/*                                                                            */
/******************************************************************************/

typedef WidgetMaker = Widget Function();


/******************************************************************************/
/*                                                                            */
/***  widget wrapper functions                                              ***/
/*                                                                            */
/******************************************************************************/

// add a background color to 'child'

Widget backgroundColorWidget(Widget child, Color? backgroundColor) {
    if ((backgroundColor is Color) == false) return child;
    final bdec = BoxDecoration(color:backgroundColor);
    return DecoratedBox(child:child, decoration:bdec);
}

// simple button

Widget button(String title, VoidCallback proc) {
    return ElevatedButton(child:Text(title), onPressed:proc);
}

// box that has a fixed height

Widget fixedHeightBox(Widget child, double height) {
    final data = BoxConstraints(maxHeight:height, minHeight:height);
    return ConstrainedBox(child:child, constraints:data);
}

// force 'child' to be at least minWidth pixels wide

Widget minimumWidthBox(Widget child, double minWidth) {
    final data = BoxConstraints(minWidth:minWidth);
    return ConstrainedBox(child:child, constraints:data);
}

// force widget rebuild on device rotation

Widget orientationWidget(WidgetMaker widgetMaker) {
    return OrientationBuilder(builder:(a, b){return widgetMaker();});
}

// single-child scroll view

Widget scrollWidget(Widget child) {
    return Scrollbar(child:SingleChildScrollView(child:child));
}
