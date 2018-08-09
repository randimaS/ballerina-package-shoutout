import ballerina/io;
import ShouOUT/shoutout;

endpoint shoutout:Client  shoutoutEP {
  host:"localhost",
  port: "111",
  apiResource: "/send/sms"
};

function main(string... args) {
 shoutoutEP->sendSMS ("Test message" , "33243242");

}