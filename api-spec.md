# Content Analysis - Draft API Specification

## Summary

The Content Analysis Service (CAS) must be exposed via a versionable API so that it can respond to client
requests with content payloads. It must return a response to the client in the context of the content payload and 
provide relevant metadata including its publishable state.

The CAS must be comprised of distinct content services that assess the content in different ways. The CAS
must not be a single all-in-one service, though it may expose helper endpoints to aggregate the different
services into a single response. Each of the analysis services must be accessible individually.


## High-level principles for analysis services

* A service must do one thing only and always return a response

* A service must not trust user input

* A service must not repeat back user input to the user

* A service must not return markup as a response

* An asynchronous service must return a job hash/uuid in its response

* A client must be able to query the status of an asynchronous service

* A service must discard the results of an asynchronous service once a client has received them in a response.

* A service must be accessible at a distinct URL

* A service must provide a descriptive error should it fail


## Endpoints and versioning

The CAS endpoints must be accessible via `/api/v<number>/:service`, where `v<number>` indicates a specific
version of the API, and `:service` represents the service being called.  


## Requests

A request to an endpoint must contain the required fields in order to receive a valid response.
As the endpoint itself determines _what_ service is being accessed, the request must include the parameters it requires.  

A request payload looks like:

```
{ 
    params: {
        content: [...],
    },
}
```


## Responses

A response payload looks like:

```
{
    result:
    error:
}
```