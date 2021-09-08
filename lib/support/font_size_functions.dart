// font_size_functions.dart -- font size functions
// by allen brunson  september 3 2021


/******************************************************************************/
/*                                                                            */
/***  font size functions                                                   ***/
/*                                                                            */
/******************************************************************************/

double currentFontSize() {
    return 18.0;
}

double scaledFontSize(double multiplier) {
    return (currentFontSize() * multiplier).ceilToDouble();
}
