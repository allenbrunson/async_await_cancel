// date_time_int.dart -- date/time int conversion functions
// by allen brunson  march 20 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  millisecond/microsecond <=> timestamp functions                       ***/
/*                                                                            */
/******************************************************************************/

double microsecondsToTimestamp(int? microseconds) {
    return intToDouble(microseconds) / _microsecondMultiplier();
}

double millisecondsToTimestamp(int? milliseconds) {
    return intToDouble(milliseconds) / _millisecondMultiplier();
}

int timestampToMicroseconds(double? timestamp) {
    return doubleToInt(sanitizeDouble(timestamp) * _microsecondMultiplier());
}

int timestampToMilliseconds(double? timestamp) {
    return doubleToInt(sanitizeDouble(timestamp) * _millisecondMultiplier());
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

double _microsecondMultiplier() {
    return 1000000.0;
}

double _millisecondMultiplier() {
    return 1000.0;
}


/******************************************************************************/
/*                                                                            */
/***  timestamp to int conversion functions                                 ***/
/*                                                                            */
/******************************************************************************

overview
--------

converts timestamps to integer formats, and vice versa

*/
