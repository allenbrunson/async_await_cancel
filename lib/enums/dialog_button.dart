// dialog_button.dart -- dialog button enum
// by allen brunson  february 27 2018


/******************************************************************************/
/*                                                                            */
/***  DialogButton enum                                                     ***/
/*                                                                            */
/******************************************************************************/

enum DialogButton
{
    okay,
    cancel
}


/******************************************************************************/
/*                                                                            */
/***  DialogButton support functions                                        ***/
/*                                                                            */
/******************************************************************************/

bool isDialogButton(dynamic dialogButton) {
    return (dialogButton is DialogButton);
}

DialogButton sanitizeDialogButton(DialogButton? dialogButton) {
    if (isDialogButton(dialogButton)) return dialogButton!;
    return DialogButton.cancel;
}
