import ballerina/io;

public type Client object {
     public ClientConfig config;
     public ClientConnector connector = new;
     public function init(ClientConfig  clientConfig);
     public function getCallerActions() returns ClientConnector ;
};

function Client::init(ClientConfig  clientConfig)  {
    io:println("Calling client init method");
    io:println("url " + clientConfig.host);
    io:println("port " + clientConfig.port);
    io:println("api resource " + clientConfig.apiResource);
    self.connector.host = clientConfig.host;
    self.connector.port = clientConfig.port;
    self.connector.apiResource = clientConfig.apiResource;
}

function Client::getCallerActions() returns  ClientConnector{
    return self.connector;   
}

