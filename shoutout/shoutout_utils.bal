import ballerina/http;

function parseResponseToJson(http:Response|error response) returns (json|error) {
    json result = {};
        if (response is http:Response) {
        var jsonPayload = response.getJsonPayload();
        if (jsonPayload is json){
            return jsonPayload;
        }
        else{
            error err = error("(module/shoutout)ShoutOutError",{ message: "Error occurred when parsing response to json." });
            return err;
        }
    }
    else{
        error err = error("(module/shoutout)ShoutOutError",{ message: "Error occurred when HTTP client invocation." });
        return err;
    }
}