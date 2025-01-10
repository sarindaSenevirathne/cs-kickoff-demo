import ballerina/http;

configurable string url = ?;

service / on new http:Listener(9090) {

    resource function get demo() returns http:Response|error {
        // Send a response back to the caller.
        http:Client clientEndpoint = check new (url, {
            httpVersion: "2.0",
            poolConfig: {
                minEvictableIdleTime: 300 //Minimum evictable time for an idle connection in seconds. Default value is 5 minutes
            }
        });

        http:Response response = check clientEndpoint->get("/");

        return response;
    }
}
