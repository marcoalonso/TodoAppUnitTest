//
//  Springboard.swift
//  TodoAppEndToEndTests
//
//  Created by Marco Alonso Rodriguez on 10/05/23.
//

import Foundation
import XCTest

class Springboard {
    
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteApp(){
        XCUIApplication().terminate()
        springboard.activate()
        
        let appIcon = springboard.icons.matching(identifier: "TodoApp").firstMatch
        appIcon.press(forDuration: 1.5)
        
        let _ = springboard.buttons["Remove App"].waitForExistence(timeout: 1.0)
        springboard.buttons["Remove App"].tap()
        
        let deleteButton = springboard.alerts.buttons["Delete App"].firstMatch
        if deleteButton.waitForExistence(timeout: 5) {
            deleteButton.tap()
            springboard.alerts.buttons["Delete"].tap()
        }
    }
    
}
