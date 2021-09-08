// analyze_functions.dart -- dart analysis support
// by allen brunson  june 17 2021

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  dart analysis functions                                               ***/
/*                                                                            */
/******************************************************************************/

void unawaited(Future<void>? future) {
    // nothing to do
}


/******************************************************************************/
/*                                                                            */
/***  dart analysis functions                                               ***/
/*                                                                            */
/******************************************************************************

overview
--------

i used to include the pedantic package in my projects, because it has one lone
function i need to support dart analysis. in june 2021, that package was
deprecated.

the google guys suggest that you should migrate to the lints package for dart or
flutter_lints for flutter. as far as i can tell, neither of those two packages
has that lone function i need. so i moved the function into my own code.

i would much prefer to use the "official" version. in the future, the geniuses
at google may conclude that the function needs updating for some reason. but
that appears to be impossible now.

*/
