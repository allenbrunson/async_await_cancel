// net_response.dart -- NetResponse object
// by allen brunson  september 1 2021


/******************************************************************************/
/*                                                                            */
/***  module defines                                                        ***/
/*                                                                            */
/******************************************************************************/

typedef NetResponseProc = Future<NetResponse> Function();


/******************************************************************************/
/*                                                                            */
/***  http status codes                                                     ***/
/*                                                                            */
/******************************************************************************/

const int kStatusCodeSuccess  = 200;
const int kStatusCodeCanceled = 499;


/******************************************************************************/
/*                                                                            */
/***  NetResponse object                                                    ***/
/*                                                                            */
/******************************************************************************/

class NetResponse
{
    // final instance variables

    final int statusCode;
    final String errorString;

    // construction

    NetResponse(this.statusCode, this.errorString);

    static NetResponse canceledRequest() {
        return NetResponse(kStatusCodeCanceled, "Canceled");
    }

    static NetResponse successfulRequest() {
        return NetResponse(kStatusCodeSuccess, "Success");
    }

    // instance methods

    bool canceled() {
        return this.statusCode == kStatusCodeCanceled;
    }

    bool failedButNotCanceled() {
        return (this.succeeded() == false) && (this.canceled() == false);
    }

    String get title {
        return "Network Request";
    }

    bool succeeded() {
        return this.statusCode == kStatusCodeSuccess;
    }
}


/******************************************************************************/
/*                                                                            */
/***  NetResponse support functions                                         ***/
/*                                                                            */
/******************************************************************************/

bool isNetResponse(dynamic netResponse) {
    return (netResponse is NetResponse);
}


/******************************************************************************/
/*                                                                            */
/***  NetResponse object                                                    ***/
/*                                                                            */
/******************************************************************************

overview
--------

this object represents everything you get back from a network request. because
this is just a demo program, this class is incomplete. it would need a lot more
instance variables and methods, if it were to be part of a real program.

*/
