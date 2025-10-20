// double_functions.dart -- double support functions
// by allen brunson  september 6 2021


/******************************************************************************/
/*                                                                            */
/***  double support functions                                              ***/
/*                                                                            */
/******************************************************************************/

double doubleCeil(double? value) {
    return sanitizeDouble(value).ceilToDouble();
}

int doubleToInt(double? value) {
    return sanitizeDouble(value).toInt();
}

bool isDouble(dynamic value) {
    return (value is double);
}

double sanitizeDouble(dynamic value) {
    if (value is double) return value;
    return 0.0;
}
