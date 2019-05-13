### ScopeAgent-Reference-iOS

ScopeAgent-Reference is the reference app to showcase Scope integration and functionality in an iOS project. 

It is configured as explained in [https://scope.undefinedlabs.com/docs/installation.html](https://scope.undefinedlabs.com/docs/installation.html) using:

- **Cocoapods**: *Podfile* explains pods and usage
- **CircleCI**: See *Environment Variables* in test Scheme
- **Upload symbols**: Check *Upload Symbols* in ScopeAgent-ReferenceTests *Build Phases* for crash symbolication

ScopeAgent-Reference is written in Swift but ScopeAgent.framework can also be used from Objective-Cwith Carthage 

In `ScopeAgent_ReferenceTests.swift` there are a variety of tests that show the different outputs that Scope show with each one.

It also implements Logging integration in the app logging class: See `Logger.swift` for details

It shows automatic integration of networking requests in `Networking.swift` without any changes and also shows how to add instrumentation to your own Services  to show services integration in `Geolocation.swift`

