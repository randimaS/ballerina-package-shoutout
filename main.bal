import ballerina/io;
import shoutout;

endpoint shoutout:Client shoutoutEP {
};

endpoint shoutout:Client shoutoutLiteEP {
  endpointType: "lite"
};

function main(string... args) {
  string apiKey = "Apikey xxx";
  string destinations = "+94xxx";
  string content = "Test SMS";
  shoutoutEP->sendOTP(apiKey, destinations, content);
  shoutoutLiteEP->sendSMS(apiKey, destinations, content);
}