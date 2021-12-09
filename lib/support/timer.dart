// timer.dart -- timing-related functions
// by allen brunson  december 12 2018

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  periodic timer functions                                              ***/
/*                                                                            */
/******************************************************************************/

Timer? cancelPeriodicTimer(Timer? timer) {
    if (timer is Timer) timer.cancel();
    return null;
}

Timer? periodicTimer(double duration, VoidCallback timerProc) {
    if (duration <= 0.0) return null;
    return Timer.periodic(durationSeconds(duration), (_){timerProc();});
}
