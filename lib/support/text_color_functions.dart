// text_color_functions.dart -- text color functions
// by allen brunson  september 18 2019

import "package:async_await_cancel/async_await_cancel.dart";


/******************************************************************************/
/*                                                                            */
/***  text color functions                                                  ***/
/*                                                                            */
/******************************************************************************/

Color textColor(BuildContext? context, Color backgroundColor) {
    if (context == null) return Colors.white;
    final data = Theme.of(context).brightness;
    return _fixup(backgroundColor, _textColorForBrightness(data));
}

Color themeTextColor(Brightness brightness, Color backgroundColor) {
    return _fixup(backgroundColor, _textColorForBrightness(brightness));
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

// if 'foreground' will be viable when placed on top of 'background', then it
// be returned unchanged. if the contrast between the two colors is too low,
// then the color returned will be one that will look decent on top of the
// given background color.

Color _fixup(Color background, Color foreground) {
    final dat1 = ThemeData.estimateBrightnessForColor(background);
    final dat2 = ThemeData.estimateBrightnessForColor(foreground);
    if (dat1 == dat2) return _textColorForBrightness(dat1);
    return foreground;
}

Color _textColorForBrightness(Brightness brightness) {
    if (brightness == Brightness.light) return Colors.black;
    return Colors.white;
}
