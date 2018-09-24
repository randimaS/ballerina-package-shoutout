import ballerina/http;

public type ShoutoutError record {
    string message;
    error? cause;
};