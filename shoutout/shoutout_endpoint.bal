import ballerina/io;
import ballerina/http;


public type ShoutOutConfiguration record {
    http:ClientEndpointConfig restClientConfig = {};
    string apiKey;
};

public type Client client object {

    http:Client shoutOutRestClient;
    string apiKey;

    public function __init(ShoutOutConfiguration shoutOutConfig) {
        self.shoutOutRestClient = new("https://api.getshoutout.com");
        self.apiKey = "Apikey " + <string>shoutOutConfig.apiKey;

    }

    public remote function sendSMS(string destination, string content) returns json|error;
    public remote function sendOTP(string destination) returns json|error;
    public remote function verifyOTP(string code, string referenceId) returns json|error;
};

public remote function Client.sendSMS(string destination, string content) returns json|error{

    string endpointResource = MSG_SEND;
    json sendSmsJsonPayload = {"source": SHOUTOUT_DEMO,"destinations": [destination] ,"transports": [SMS_TRANSPORT] ,"content": {"sms": content}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(untaint sendSmsJsonPayload);

    // Make an HTTP POST request
    var response = self.shoutOutRestClient->post(endpointResource, request);
    //Check for empty payloads and errors
    json validatedResponse = check parseResponseToJson(response);
    return validatedResponse;

}

public remote function Client.sendOTP(string destination) returns json|error {

    string endpointResource = "/otpservice/send";
    json sendOtpJsonPayload = {"source": SHOUTOUT_DEMO,"destination": destination, "transport": SMS_TRANSPORT ,"content": {"sms": "ShoutOUT code is {{code}}"}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(untaint sendOtpJsonPayload);

    var response = self.shoutOutRestClient->post(endpointResource, request);
    json validatedResponse = check parseResponseToJson(response);
    return validatedResponse;
}

public remote function Client.verifyOTP(string code, string referenceId) returns json|error{

    string resourcePath = OTP_VERIFY;
    json verifyOtpJsonPayload = {"code": code,"referenceId": referenceId };

    http:Request request = new;
    request.setHeader(AUTHORIZATION, self.apiKey);
    request.setJsonPayload(verifyOtpJsonPayload);

    var response = self.shoutOutRestClient->post(resourcePath, request);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}

