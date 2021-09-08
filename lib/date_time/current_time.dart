// current_time.dart -- current time functions
// by allen brunson  march 20 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  current time functions                                                ***/
/*                                                                            */
/******************************************************************************/

double currentTime() {
    return microsecondsToTimestamp(currentTimeMicroseconds());
}

int currentTimeMicroseconds() {
    return DateTime.now().microsecondsSinceEpoch;
}
