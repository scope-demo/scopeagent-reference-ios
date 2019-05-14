//
//  Networking.swift
//  ScopeAgent-Reference
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//

/**
 * SCOPE
 *
 * Networking class show how Scope is able to integrate with networking calls without adding any code, just by being linked to your test target
 * ScopeAgent is not imported here but requests  will apear in Scope
 */

import UIKit
import Alamofire

class Networking {
    
    class func alamofireExample(callback:@escaping ()->Void) {
        
        let url = URL(string: "http://httpbin.org/get")!
        Alamofire.request(url, parameters: ["foo": "bar"])
            .response { response in
                print(response)
                callback()
        }
    }

    class func urlSessionExample(callback:@escaping ()->Void) {
        
        let url = URL(string: "http://httpbin.org/ip")!
        let task = URLSession.shared.dataTask(with: url) { data,response,error  in
            if let data = data,
                let response = String(data: data, encoding: .utf8) {
                    print( response )
                    callback()
            }
        }
        task.resume()
        
    }
}
