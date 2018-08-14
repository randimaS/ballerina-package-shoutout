import ballerina/io;
import ballerina/http;

public type ShoutOutConnector object  {
    public string host;
    public string port;
    public string apiResource;
    public http:Client shoutOutRestClient = new;


    public function sendSMS(string smsSource, string smsDestinations,string transports,string smsContent);
};


function ShoutOutConnector::sendSMS(string smsSource, string smsDestinations,string transports,string smsContent)  {
    io:println("host :" + self.host + " port : " + self.port + " api resource :" + self.apiResource);
    io:println("Sending sms messge : " + smsContent + " to phone no : " + smsDestinations);
    //endpoint http:Client shoutOutEndpoint = self.shoutOutRestClient;
    json sendSmsJsonPayload = { "source": smsSource,"destinations": [smsDestinations] , "transports": [transports] , "content": { "sms": smsContent } };


}