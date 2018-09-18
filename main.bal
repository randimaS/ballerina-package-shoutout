import ballerina/io;
import shoutout;

endpoint shoutout:Client shoutoutEP {
  apiKey: "xxx"
};

function main(string... args) {
  string destinations = "+94 XXXX";
  string SMScontent = "Test SMS";
  string OTPCode = "XXXXX";
  string OTPReferenceId ="XXXXXX";

  var smsResponse = shoutoutEP->sendSMS(destinations, SMScontent);
  io:println(smsResponse);

  var otpResponse = shoutoutEP->sendOTP(destinations);
  io:println(otpResponse);

  var otpResponse = shoutoutEP->verifyOTP(OTPCode,OTPReferenceId);
  io:println(otpResponse);
}
