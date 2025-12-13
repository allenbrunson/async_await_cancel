// string_functions.dart -- string object support functions
// by allen brunson  september 6 2021


/******************************************************************************/
/*                                                                            */
/***  String support functions                                              ***/
/*                                                                            */
/******************************************************************************/

String charString(int char) {
    return String.fromCharCode(char);
}

String ellipsis(String? string) {
    return "${sanitizeString(string)} ${charString(0x2026)}";
}

String emptyString() {
    return "";
}

bool isString(dynamic string) {
    return (string is String);
}

String sanitizeString(dynamic string) {
    if (string is String) return string;
    return emptyString();
}

bool stringHasLength(String? string) {
    return sanitizeString(string).isNotEmpty;
}

bool stringIsEmpty(String? string) {
    return sanitizeString(string).isEmpty;
}

String trimString(String? string) {
    return sanitizeString(string).trim();
}
