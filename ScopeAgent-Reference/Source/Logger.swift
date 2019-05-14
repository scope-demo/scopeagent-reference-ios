//
//  Logger.swift
//  ScopeAgent-Reference
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//

/**
 * SCOPE
 *
 * This class represents a custom logging class for the application, all the app uses this interface for logging information
 * ScopeAgent is imported here to integrate the logs of the app to the results that Scope provides.
 * We must add some some code to original class to make it possible
 *
 * @see https://github.com/undefinedlabs/ios-agent#http-instrumentation
 */

import Foundation
import ScopeAgent

class Logger {
    
    class func logDebug(_ text: String, filename: String = #file, line: Int = #line, fields: [String : Any]? = nil) {
        print("🔘 - \(text)")
        
        /* SCOPE
         * We must add the following line to integrate logs with Scope
         */
        SALogger.log(text, .debug, filename:filename, line: line, fields: fields)
        /*SCOPE*/
    }
    
    
    class func logInfo(_ text: String, filename: String = #file, line: Int = #line, fields: [String : Any]? = nil) {
        print("ℹ️ - \(text)")
        
        /* SCOPE
        * We must add the following line to integrate logs with Scope
        */
        SALogger.log(text, .info, filename:filename, line: line, fields: fields)
        /*SCOPE*/
    }
    
    class func logWarning(_ text: String, filename: String = #file, line: Int = #line, fields: [String : Any]? = nil) {
        print("☢️ - \(text)")
        
        /* SCOPE
         * We must add the following line to integrate logs with Scope
         */
        SALogger.log(text, .warning, filename:filename, line: line, fields: fields)
        /*SCOPE*/
    }
    
    class func logError(_ text: String, filename: String = #file, line: Int = #line, fields: [String : Any]? = nil) {
        print("🆘 - \(text)")
    
        /* SCOPE
         * We must add the following line to integrate logs with Scope
         */
        SALogger.log(text, .error, filename:filename, line: line, fields: fields)
        /*SCOPE*/
    }
}
