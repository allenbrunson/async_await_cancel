// list_functions.dart -- list support functions
// by allen brunson  september 6 2021


/******************************************************************************/
/*                                                                            */
/***  list support functions                                                ***/
/*                                                                            */
/******************************************************************************/

void listAdd<T>(List<T> list, dynamic object) {
    if (listValidObject<T>(object) && (object is T)) list.add(object);
}

bool listValidObject<T>(dynamic object) {
    if (object == null) return false;
    return (object is T);
}
