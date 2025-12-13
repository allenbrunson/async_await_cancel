// dialog_button.dart -- dialog button enum
// by allen brunson  february 27 2018


/******************************************************************************/
/*                                                                            */
/***  DialogButton enum                                                     ***/
/*                                                                            */
/******************************************************************************/

enum DialogButton {
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
    if (dialogButton is DialogButton) return dialogButton;
    return DialogButton.cancel;
}
