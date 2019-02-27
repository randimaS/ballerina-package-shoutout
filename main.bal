import ballerina/io;
import ballerina/config;
import shoutout;

shoutout:ShoutOutConfiguration shoutOutConfig = {
  apiKey: "XXXXXXXXXXX"
};

shoutout:Client shoutOutClient = new (shoutOutConfig);

public function main(string... args) {
  string destinations = "+XXXXXX";
  string SMScontent = "Test SMS";
  string OTPCode = "XXXXX";
  string OTPReferenceId ="XXXX-XXXX-XXXXXXX-XX-XXXXXXXXX";

  var smsResponse = shoutOutClient->sendSMS(destinations, SMScontent);
  io:println(smsResponse);

  var otpResponse = shoutOutClient->sendOTP(destinations);
  io:println(otpResponse);

  var verifyOtpResponse = shoutOutClient->verifyOTP(OTPCode,OTPReferenceId);
  io:println(verifyOtpResponse);
}
