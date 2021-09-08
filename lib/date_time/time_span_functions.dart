// time_span_functions.dart -- time span calculation functions
// by allen brunson  march 20 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  time span calculation functions                                       ***/
/*                                                                            */
/******************************************************************************/

double elapsedTime(double startTime) {
    return currentTime() - startTime;
}

double futureTime(double stopTime) {
    return stopTime - currentTime();
}
