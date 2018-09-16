import ballerina/io;
import ballerina/http;

public type ShoutOutConnector object  {
    public http:Client shoutOutRestClient;

    public function sendSMS(string apiKey, string destination, string content) returns (json|ShoutoutError);
    public function sendOTP(string apiKey, string destination) returns (json|ShoutoutError);
    public function verifyOTP(string apiKey, string code, string referenceId) returns (json|ShoutoutError);
};


function ShoutOutConnector::sendSMS(string apiKey, string destination, string content) returns (json|ShoutoutError){

    endpoint http:Client httpClient = self.shoutOutRestClient;
    string resourcePath = MSG_SEND;
    json sendSmsJsonPayload = {"source": SHOUTOUT_DEMO,"destinations": [destination] ,"transports": [SMS_TRANSPORT] ,"content": {"sms": content}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, apiKey);
    request.setJsonPayload(sendSmsJsonPayload);

    var response = httpClient->post(resourcePath, request);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;

}

function ShoutOutConnector::sendOTP(string apiKey, string destination) returns (json|ShoutoutError) {

    endpoint http:Client httpClient = self.shoutOutRestClient;
    string resourcePath = OTP_SEND;
    json sendOtpJsonPayload = {"source": SHOUTOUT_DEMO,"destination": destination, "transport": SMS_TRANSPORT ,"content": {"sms": "ShoutOUT code is {{code}}"}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, apiKey);
    request.setJsonPayload(sendOtpJsonPayload);

    var response = httpClient->post(resourcePath, request);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}


function ShoutOutConnector::verifyOTP(string apiKey, string code, string referenceId) returns (json|ShoutoutError){

    endpoint http:Client httpClient = self.shoutOutRestClient;
    string resourcePath = OTP_VERIFY;
    json verifyOtpJsonPayload = {"code": code,"referenceId": referenceId };

    http:Request request = new;
    request.setHeader(AUTHORIZATION, apiKey);
    request.setJsonPayload(verifyOtpJsonPayload);

    var response = httpClient->post(resourcePath, request);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}
