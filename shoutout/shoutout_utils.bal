import ballerina/http;

function parseResponseToJson(http:Response|error response) returns (json|ShoutoutError) {
    json result = {};
    if (response is http:Response) {
        var jsonPayload = response.getJsonPayload();
        if (jsonPayload is json){
            return jsonPayload;
        }
        else{
            ShoutoutError shoutoutError = { message: "Error occurred when parsing response to json." };
            shoutoutError.cause = err.cause;
            return shoutoutError;
        }
    }
    else{
        ShoutoutError shoutoutError = { message: "Error occurred when HTTP client invocation." };
        shoutoutError.cause = err.cause;
        return shoutoutError;
    }
}
