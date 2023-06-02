// screen.dart -- screen functions
// by allen brunson  december 8 2018

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  screen functions                                                      ***/
/*                                                                            */
/******************************************************************************/

// screen size rounded down to the nearest pixel

Size screenSize() {
    return sizeFloor(_rawScreenSize());
}

// screen width rounded down to the nearest pixel

double screenWidth() {
    return screenSize().width;
}

// media query data for the whole screen

MediaQueryData windowMediaQueryData() {
    final plat = WidgetsBinding.instance.platformDispatcher;
    final view = plat.views.first;
    return MediaQueryData.fromView(view);
}


/******************************************************************************/
/*                                                                            */
/***  private screen functions                                              ***/
/*                                                                            */
/******************************************************************************/

// 1) width and height are swapped when rotating from portrait to landscape
// 2) android devices can report fractional pixel counts

Size _rawScreenSize() {
    return windowMediaQueryData().size;
}
