// net_prefs.dart -- network preferences
// by allen brunson  september 25 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  NetPrefs class                                                        ***/
/*                                                                            */
/******************************************************************************/

class NetPrefs
{
    // network prefs

    static double timeout([double? timeoutOverride]) {
        const tmin = 0.75;
        final tmo1 = sanitizeDouble(timeoutOverride);
        final tmo2 = sanitizeDouble(_timeout);
        if (tmo1 >= tmin) return tmo1;
        if (tmo2 >= tmin) return tmo2;
        return tmin;
    }

   // setters

    static void setDefaultTimeout() {
        setTimeout(_timeoutDefault());
    }

    static void setTimeout(double timeout) {
        _timeout = timeout;
    }

    // private utility functions

    static double _timeoutDefault() {
        return 30.0;
    }

    // private static variables

    static double _timeout = _timeoutDefault();
}


/******************************************************************************/
/*                                                                            */
/***  NetPrefs class                                                        ***/
/*                                                                            */
/******************************************************************************

overview
--------

local gathering place for network preferences

*/
