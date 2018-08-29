import ballerina/io;
import ballerina/http;

public type ShoutOutConfig record {
    http:ClientEndpointConfig clientConfig;
};

public type Client object {
    public ShoutOutConfig shoutoutClientConfiguration = {};
    public ShoutOutConnector shoutOutConnector = new;

    public function init(ShoutOutConfig shoutOutConfig);
    public function getCallerActions() returns ShoutOutConnector;
};

function Client::init(ShoutOutConfig shoutOutConfig)  {
    shoutOutConfig.clientConfig.url = SHOUTOUT_LITE_API_BASE_URL;
    self.shoutOutConnector.shoutOutRestClient.init(shoutOutConfig.clientConfig);
}

function Client::getCallerActions() returns  ShoutOutConnector{
    return self.shoutOutConnector;
}

