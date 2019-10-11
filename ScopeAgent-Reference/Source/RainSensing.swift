//
//  RainSensing.swift
//  ScopeAgent-Reference
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//

/**
 * SCOPE
 *
 * RainSensing and Wipers classes are internal application classes.
 * They are using custom tracing using OpenTracing library.
 * ScopeAgent is not imported here but Scope integrates Opentracing, if we configure Scope
 * as the OpenTracing global tracer these Spans will be shown in Scope.
 * This project does it with Test environment variable: SCOPE_SET_GLOBAL_TRACER = YES
 */

import Foundation
import Darwin
import opentracing

class Climate {
    static var raining = false
}


class Wipers {
    
    static let shared = Wipers()
    
    private init(){}
    
    let numRepetition = 2
    
    func activate() {
        /**
         * SCOPE
         * The following lines create a span that will group all the work done inside the method
         */
        let span = OTGlobal.sharedTracer().startSpan("activateWipers()")
        defer {
            span.finish()
        }
        /*SCOPE*/

        
        for _ in 0 ..< numRepetition {
            wipeRight()
            wipeLeft()
        }
    }
    
    private func wipeRight() {
        /**
         * SCOPE
         * The following lines create a span that will group all the work done inside the method
         */
        let span = OTGlobal.sharedTracer().startSpan("wipeRight()")
        defer {
            span.finish()
        }
        /*SCOPE*/
        print("wiping right")
        usleep(250_000)
    }
    
    private func wipeLeft() {
        /**
         * SCOPE
         * The following lines create a span that will group all the work done inside the method
         */
        let span = OTGlobal.sharedTracer().startSpan("wipeLeft()")
        defer {
            span.finish()
        }
        /*SCOPE*/
        print("wiping left")
        usleep(250_000)
    }
}

class RainSensing {
    
    class func detectRain() -> Bool {
        if Climate.raining {
            rainDetected()
            return true
        }
        return false;
    }
    
    private class func rainDetected() {
        /**
         * SCOPE
         * The following lines create a span that will group all the work done inside the method
         */
        let span = OTGlobal.sharedTracer().startSpan("rainDetected()")
        defer {
            span.finish()
        }
        /*SCOPE*/

        print("rain detected")
        Wipers.shared.activate()
    }
}
