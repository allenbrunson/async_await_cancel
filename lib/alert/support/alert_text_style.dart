// alert_text_style.dart -- alert text style functions
// by allen brunson  february 24 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  alert text style functions                                            ***/
/*                                                                            */
/******************************************************************************/

TextStyle alertButtonTextStyle() {
    return _plain(scaledFontSize(0.96));
}

TextStyle alertMessageTextStyle() {
    return _plain(scaledFontSize(0.85));
}

TextStyle alertTitleTextStyle() {
    return _bold(scaledFontSize(1.02));
}

TextStyle alertChoiceSelectionTextStyle() {
    return _plain(scaledFontSize(1.0));
}

TextStyle alertChoiceTitleTextStyle() {
    return _bold(scaledFontSize(1.16));
}


/******************************************************************************/
/*                                                                            */
/***  text style creators                                                   ***/
/*                                                                            */
/******************************************************************************/

TextStyle _bold(double fontSize) {
    return TextStyle(fontWeight:FontWeight.bold, fontSize:fontSize);
}

TextStyle _plain(double fontSize) {
    return TextStyle(fontSize:fontSize);
}
