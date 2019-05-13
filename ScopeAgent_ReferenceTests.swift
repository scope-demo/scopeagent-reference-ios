//
//  ScopeAgent_ReferenceTests.swift
//  ScopeAgent-ReferenceTests
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//

/**
 * SCOPE
 * The following tests are written to show most of functionality that can be shown using Scope.
 * Each test is focused in some functionality and the callee methods show how Scope is integrated
 
 */

import XCTest
@testable import ScopeAgent_Reference

class ScopeAgent_ReferenceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
     * SCOPE
     * Example of a passing test
     */
    func testPass() {
        AssistantManager.shared.notifySystem()
        XCTAssert(true)
    }
    
    /**
     * SCOPE
     * Example of a failing test
     */
    func testFail() {
        AssistantManager.shared.provideAssistance()
        XCTAssert( AssistantManager.shared.status == .error)
    }
    
    
    /**
     * SCOPE
     * This test shows how Scope captures networking activity initiated with Alamofire without neededing any custom code
     */
    func testNetworkingAlamofire() {
        Networking.alamofireExample()
        XCTAssert(true)
    }
    
    /**
     * SCOPE
     * This test shows how Scope captures networking activity initiated with default URLSession without neededing any custom code
     */
    func testNetworkingURLSession() {
        Networking.urlSessionExample()
        XCTAssert(true)
    }
    
    /**
     * SCOPE
     * This test shows integration of application using Scope with service using Scope, so we can correlate request with server executions.
     * We are using Alamofire framework for networking. Check getLocationWithAlamofire in Geolocation.swift for example implementation
     */
    func testServicesIntegrationWithAlamofire() {
        
        let expec = expectation(description: "testServicesIntegrationWithAlamofire")
        
        Geolocation.getLocationWithAlamofire(identifier: Identifiers.good_identifier) { location in
            XCTAssert(  location != nil )
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /**
     * SCOPE
     * This test shows integration of application using Scope with service using Scope, so we can correlate request with server executions.
     * We are using URLSession framework for networking. Check getLocationWithURLSession in Geolocation.swift for example implementation
     */
    func testServicesIntegrationWithURLSession() {
        
        let expec = expectation(description: "testServicesIntegrationWithURLSession")
        
        Geolocation.getLocationWithURLSession(identifier: Identifiers.good_identifier) { location in
            XCTAssert(  location != nil )
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /**
     * SCOPE
     * This test shows integration of application using Scope with service using Scope, so we can correlate request with server executions.
     * This execution will produce an error in the server that we can see in Scope
     */
    func testErrorInService() {
        
        let expec = expectation(description: "testCarGeoLocateServerError")
        
        Geolocation.getLocationWithAlamofire(identifier: Identifiers.bad_identifier) { location in
            XCTAssert(  location != nil )
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /**
     * SCOPE
     * This test shows integration of custom Opentracing traces in the application with Scope tracing
     */
    func testCustomOpentracing() {
        Climate.raining = true
        let raining = RainSensing.detectRain()
        XCTAssert(raining)
    }
    
    /**
     * SCOPE
     * This test shows how a custom NSException raised in the code of the app that this test run is showed in Scope
     */
    func testNSException() {
        AssistantManager.shared.status = .error
        let ok = AssistantManager.shared.checkCameraPosition()
        XCTAssert(ok)
    }
    
    /**
     * SCOPE
     * This test shows how log integration in the app shows in Scope results
     */
    func testLoggingIntegration() {
        AssistantManager.shared.sensors.logStatus()
        XCTAssert(true)
    }

    /**
     * SCOPE
     * This test shows how a crash while running a test is shown in Scope
     */
    func testCrash() {
        let heatAverage = AssistantManager.shared.checkHeatAverage()
        XCTAssert(heatAverage < 40)
    }
    
}
