import ballerina/io;
import shoutout;

endpoint shoutout:Client shoutoutEP {
};

function main(string... args) {
  string apiKey = "Apikey apiKey";
  string destinations = "+94xxxxxx";
  string SMScontent = "Test SMS";
  shoutoutEP->sendOTP(apiKey, destinations);
  shoutoutEP->sendSMS(apiKey, destinations, SMScontent);
}
