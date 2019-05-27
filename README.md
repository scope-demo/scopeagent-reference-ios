### ScopeAgent-Reference-iOS

ScopeAgent-Reference is the reference app to showcase Scope integration and functionality in an iOS project. 

It is configured as explained in [https://scope.undefinedlabs.com/docs/ios-installation](https://scope.undefinedlabs.com/docs/ios-installation) using:

- **Cocoapods**: *Podfile* explains pods and usage
- **CircleCI**: See *Environment Variables* in test Scheme
- **Upload symbols**: Check *Upload Symbols* in ScopeAgent-ReferenceTests *Build Phases* for crash symbolication

> ScopeAgent-Reference is written in Swift but ScopeAgent.framework can also be used from any project written in Objective-C.
>

It shows standard logging messages using`NSLog()`, `os_log()` or `print()` but it also implements custom logging integration in the app. See `Logger.swift` for details

It shows automatic integration of networking requests in `Networking.swift` without any changes and also shows how to add instrumentation to your own Services  to show services integration in `Geolocation.swift`

There are comments in source files to explain what changes are for Scope to work, these changes are marked with  `/* SCOPE */` comments.

#### Available Unit Tests

In `ScopeAgent_ReferenceTests.swift` there are a variety of tests that show the different outputs that Scope produces with each one. 

Unit test or simple networking test need no custom code, these tests have no Opentracing neither ScopeAgent dependency, they just show in Scope with their results automatically:

- `testPass`: Simple example of a passing test
- `testFail`: Example of a failing test
- `testStandardLogging`: Shows how NSLog, os_log or print messages appear in Scope results
- `testNetworkingAlamofire`: Alamofire request
- `testNetworkingURLSession`: Simple shared URLSession request
- `testNSException`: A test that throws an exception, so it fails
- `testCrash`: A test that produces a crash

Some code can use a custom Logging framework, you can also integrate this custom logs in Scope:

- `testCustomLoggingIntegration`: Example of custom logs, the integration implementation example is in `Logger.swift`

Integration test need some custom code so we can trace all the execution that happens since we start the request until we get a response, including all the services that the request access for the test:

- `testServicesIntegrationWithAlamofire`: Shows how to adapt integration test using Alamofire and a helper class `AlamofireTracing` written for this purpose in the app.
- `testServicesIntegrationWithURLSession`: Shows how to adapt integration test using URLSession and helper class `SAURLSessionObserver` in ScopeAgent framework.
- `testErrorInService`: Shows how an integration test thet produces an error in the service is accessing so we can check how the service error is shown in Scope.

It also supports standard trecing using Opentracing, Scope catches these traces and integrate them with the traces generated in testing. It can also be useful to add them to enrich your own tests and results:

- `testCustomOpentracing`: Shows a test that uses traces from standard opentracing

