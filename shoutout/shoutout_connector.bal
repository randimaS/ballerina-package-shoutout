import ballerina/io;
import ballerina/http;

public type ShoutOutConnector object  {
    public http:Client shoutOutRestClient;

    public function sendSMS(string apiKey, string destination, string content);
    public function sendOTP(string apiKey, string destination);
};


function ShoutOutConnector::sendSMS(string apiKey, string destination, string content) {
    endpoint http:Client httpClient = self.shoutOutRestClient;
    
    json sendSmsJsonPayload = {"source": SHOUTOUT_DEMO,"destinations": [destination] ,"transports": [SMS_TRANSPORT] ,"content": {"sms": content}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, apiKey);
    request.setJsonPayload(sendSmsJsonPayload);

    string resourcePath = MSG_SEND;

    var response = httpClient->post(resourcePath, request);
    io:println(response);
}

function ShoutOutConnector::sendOTP(string apiKey, string destination) {
    endpoint http:Client httpClient = self.shoutOutRestClient;

    json sendOtpJsonPayload = {"source": SHOUTOUT_DEMO,"destination": destination, "transport": SMS_TRANSPORT ,"content": {"sms": "ShoutOUT code is {{code}}"}};

    http:Request request = new;
    request.setHeader(AUTHORIZATION, apiKey);
    request.setJsonPayload(sendOtpJsonPayload);

    string resourcePath = OTP_SEND;

    var response = httpClient->post(resourcePath, request);
    io:println(response);
}
