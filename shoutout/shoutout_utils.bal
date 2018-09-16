import ballerina/http;

function parseResponseToJson(http:Response|error response) returns (json|ShoutoutError) {
    json result = {};
    match response {
        http:Response httpResponse => {
            var jsonPayload = httpResponse.getJsonPayload();
            match jsonPayload {
                json payload => {

                    return payload;
                }
                error err => {
                    ShoutoutError shoutoutError = { message: "Error occurred when parsing response to json." };
                    shoutoutError.cause = err.cause;
                    return shoutoutError;
                }
            }
        }
        error err => {
            ShoutoutError shoutoutError = { message: "Error occurred when HTTP client invocation." };
            shoutoutError.cause = err.cause;
            return shoutoutError;
        }
    }
}
