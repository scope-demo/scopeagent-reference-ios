### ScopeAgent-Reference-iOS

ScopeAgent-Reference is the reference app to showcase Scope integration and functionality in an iOS project. 

It is configured as explained in [https://scope.undefinedlabs.com/docs/ios-installation](https://scope.undefinedlabs.com/docs/ios-installation) using:

- **Cocoapods**: *Podfile* explains pods and usage
- **CircleCI**: See *Environment Variables* in test Scheme
- **Upload symbols**: Check *Upload Symbols* in ScopeAgent-ReferenceTests *Build Phases* for crash symbolication

> ScopeAgent-Reference is written in Swift but ScopeAgent.framework can also be used from any project written in Objective-C.
>

The project uses standard logging mechanisms like `NSLog()`, `os_log()` or `print()` (which will show up in Scope), but it also implements custom logging integration in the app. See `Logger.swift` for details.

It shows automatic logging of networking requests in `Networking.swift` without any changes, and also how to add instrumentation to outgoing requests for integration tests to show tracing information from other services in `Geolocation.swift`

There are comments in source files to explain what changes are for Scope to work. These changes are marked with  `/* SCOPE */` comments.

#### Available Unit Tests

In `ScopeAgent_ReferenceTests.swift` there are a variety of tests that show the different outputs that Scope produces with each one. 

Unit tests or simple networking tests need no custom code, they just show in Scope with their results automatically:

- `testPass`: Simple example of a passing test
- `testFail`: Example of a failing test
- `testStandardLogging`: Shows how `NSLog`, `os_log` or `print` messages appear in Scope results
- `testNetworkingAlamofire`: Alamofire request
- `testNetworkingURLSession`: Simple shared URLSession request
- `testNSException`: A test that throws an exception, so it fails
- `testCrash`: A test that produces a crash

Custom logging frameworks are also supported:

- `testCustomLoggingIntegration`: Example of custom logs. The integration implementation is in `Logger.swift`

Integration test need some custom code so we can trace all the execution that happens since we start the request until we get a response, including all the services that the request access for the test:

- `testServicesIntegrationWithAlamofire`: Shows how to adapt an integration test using Alamofire with the helper class `AlamofireTracing` written for this purpose
- `testServicesIntegrationWithURLSession`: Shows how to adapt an integration test using URLSession and the helper class `SAURLSessionObserver` in the ScopeAgent framework.
- `testErrorInService`: Shows an integration test that produces an error in an external service.

The agent also supports custom tracing using the OpenTracing API:

- `testCustomOpentracing`: Shows a test that creates spans and events using the OpenTracing API

