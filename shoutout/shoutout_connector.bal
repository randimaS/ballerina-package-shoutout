import ballerina/io;

public type ClientConnector object  {
    public string host;
    public string port;
    public string apiResource;
    public function sendSMS(string message, string number);
};


function ClientConnector::sendSMS(string message, string number)  {
    io:println("host :" + self.host + " port : " + self.port + " api resource :" + self.apiResource);
    io:println("Sending sms messge : " + message + " to phone no : " + number);
}