// int_functions.dart -- integer support functions
// by allen brunson  september 6 2021


/******************************************************************************/
/*                                                                            */
/***  integer support functions                                             ***/
/*                                                                            */
/******************************************************************************/

double intToDouble(int? value) {
    return sanitizeInt(value).toDouble();
}

bool isInt(dynamic value) {
    return (value is int);
}

int sanitizeInt(dynamic value) {
    if (value is int) return value;
    return 0;
}
