import ballerina/io;
import ballerina/http;

public type ShoutOutConnector object  {
    public http:Client shoutoutRestClient = new;

    public function sendSMS();
};


function ShoutOutConnector::sendSMS()  {
    //io:println("Sending sms messge : " + smsContent + " to phone no : " + smsDestinations);
    endpoint http:Client shoutOutEndpoint = self.shoutoutRestClient;
    json sendSmsJsonPayload = {"source": "ShoutDEMO","destinations": [""] ,"transports": ["sms"] ,"content": {"sms": "Test message Sent via ShoutOUT Gateway"}};
    //{ "source": smsSource,"destinations": [smsDestinations] , "transports": [transports] , "content": { "sms": smsContent } };
    http:Request request = new;
    request.setHeader("Content-Type","application/json");
    request.setHeader("Authorization","Apikey xxxxxxxxxxxx");
    request.setJsonPayload(sendSmsJsonPayload);

    string endpointResource = MSG_SEND;

    var response = shoutOutEndpoint->post(endpointResource, request);
    io:println("Response" + response);
}