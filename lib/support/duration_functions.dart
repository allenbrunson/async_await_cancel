// duration_functions.dart -- Duration object support functions
// by allen brunson  september 3 2021


/******************************************************************************/
/*                                                                            */
/***  duration functions                                                   ***/
/*                                                                            */
/******************************************************************************/

Duration durationAnimate() {
    return durationSeconds(0.25);
}

Duration durationSeconds(double seconds) {
    return Duration(milliseconds:(seconds * 1000.0).toInt());
}
