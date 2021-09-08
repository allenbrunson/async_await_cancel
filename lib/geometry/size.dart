// size.dart -- size functions
// by allen brunson  december 11 2018

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  Size functions                                                        ***/
/*                                                                            */
/******************************************************************************/

Size sizeFloor(Size size) {
    return Size(size.width.floorToDouble(), size.height.floorToDouble());
}
