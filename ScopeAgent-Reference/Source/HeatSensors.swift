//
//  HeatSensors.swift
//  ScopeAgent-Reference
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//
 
/**
 * SCOPE
 *
 * HeatSensors Manager class represent an internal application class.
 * ScopeAgent is not imported here
 */

import Foundation
 
class HeatSensors {
    
    var sensorArray = [23, 25, 47, 82, 80, 21, 45, 34, 67,
                       22, 12, 67, 09, 2, 45, 23, 25, 47, 82,
                       80, 21, 45, 34, 67, 22, 34, 67, 09, 2, 45]

    func getHeatAtSensor( index: Int ) -> Int {
        return self.sensorArray[index]
    }
    
    func logStatus() {
        for (index, value) in sensorArray.enumerated() {
            if value > 50 {
                Logger.logError("Sensor \(index) too hot", fields: ["Temperature": value])
            } else if value > 30 {
                Logger.logWarning("Sensor \(index) above normal heat", fields: ["Temperature": value])
            } else {
                Logger.logInfo("Sensor \(index) good status", fields: ["Temperature": value])
            }
        }
    }
    
}
