import ballerina/io;
import shoutout;

endpoint shoutout:Client shoutoutEP {
};

function main(string... args) {
  string apiKey = "Apikey apiKey";
  string destinations = "+94 XXXX";
  string SMScontent = "Test SMS";
  string OTPCode = "XXXXX";
  string OTPReferenceId ="XXXXXX";

  var smsResponse = shoutoutEP->sendSMS(apiKey, destinations, SMScontent);
  io:println(smsResponse);

  var otpResponse = shoutoutEP->sendOTP(apiKey, destinations);
  io:println(otpResponse);

  var otpResponse = shoutoutEP->verifyOTP(apiKey, OTPCode,OTPReferenceId);
  io:println(otpResponse);
}
