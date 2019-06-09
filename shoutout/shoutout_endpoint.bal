import ballerina/io;
import ballerina/http;


public type ShoutOutConfiguration record {
    http:ClientEndpointConfig restClientConfig = {
    
    };
    string apiKey;
};

public type Client client object {

    http:Client shoutOutRestClient;
    string apiKey;

    public function __init(ShoutOutConfiguration shoutOutConfig) {
        self.shoutOutRestClient = new(SHOUTOUT_LITE_API_BASE_URL);
        self.apiKey = APIKEY + <string>shoutOutConfig.apiKey;

    }

    public remote function sendSMS(string sender,string destination, string content) returns json | error;
    public remote function sendOTP(string sender, string destination) returns json | error;
    public remote function verifyOTP(string code, string referenceId) returns json | error;
};

public remote function Client.sendSMS(string sender, string destination, string content) returns json | error {

    string endpointResource = MSG_SEND;
    json sendSmsJsonPayload = {
        "source": sender,
        "destinations": [destination],
        "transports": [SMS_TRANSPORT],
        "content": {
            "sms": content
        }
    };

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(untaint sendSmsJsonPayload);

    // Make an HTTP POST request
    var response = self.shoutOutRestClient->post(endpointResource, request);
    //Check for empty payloads and errors
    json validatedResponse = check parseResponseToJson(response);
    return validatedResponse;

}

public remote function Client.sendOTP(string sender, string destination) returns json | error {

    string endpointResource = OTP_SEND;
    json sendOtpJsonPayload = {
        "source": sender,
        "destination": destination,
        "transport": SMS_TRANSPORT,
        "content": {
            "sms": "ShoutOUT code is {{code}}"
        }
    };

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(untaint sendOtpJsonPayload);

    var response = self.shoutOutRestClient->post(endpointResource, request);
    json validatedResponse = check parseResponseToJson(response);
    return validatedResponse;
}

public remote function Client.verifyOTP(string code, string referenceId) returns json | error {

    string resourcePath = OTP_VERIFY;
    json verifyOtpJsonPayload = {
        "code": code,
        "referenceId": referenceId
    };

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(verifyOtpJsonPayload);

    var response = self.shoutOutRestClient->post(resourcePath, request);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}

