import ballerina/io;
import shoutout;

endpoint shoutout:Client shoutoutEP {
};

endpoint shoutout:Client shoutoutLiteEP {
  endpointType: "lite"
};

function main(string... args) {
  string apiKey = "Apikey apiKey";
  string destinations = "+94xxxxxx";
  string SMScontent = "Test SMS";
  shoutoutLiteEP->sendOTP(apiKey, destinations);
  shoutoutLiteEP->sendSMS(apiKey, destinations, SMScontent);
}
