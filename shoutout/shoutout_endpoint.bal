import ballerina/io;
import ballerina/http;

public type ShouOutClientConfig record {
    http:ClientEndpointConfig clientConfig = {};
};

public type Client object {
    public ShouOutClientConfig shououtClientConfiguration = {};
    public ShoutOutConnector shououtConnector = new;

    documentation { ShoutOUT client endpoint initialization function
        P{{ShouOutClientConfig}} - ShoutOUT client configuration
    }
    public function init(ShouOutClientConfig shoutoutClientConfig);

    documentation { Return the GitHub client
        R{{}} - ShouOut client
    }
    public function getCallerActions() returns ShoutOutConnector;

};

function Client::init(ShouOutClientConfig shoutoutClientConfig)  {
    io:println("Calling client init method");

    // Set the target url to the ShoutOUT REST API endpoint
    shoutoutClientConfig.clientConfig.url = SHOUTOUT_LITE_API_BASE_URL;

    // Initialize the client endpoint with the configurations
    self.shououtConnector.shououtRestClient.init(shoutoutClientConfig.clientConfig);
}

function Client::getCallerActions() returns  ShoutOutConnector{
    return self.shououtConnector;
}

