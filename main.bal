import ballerina/io;
import shoutout/sms;

endpoint sms:Client  shoutoutEP {
  host:"localhost",
  port: "111",
  apiResource: "/send/sms"
};

function main(string... args) {
 shoutoutEP->sendSMS ("Test message1" , "33243242");

}