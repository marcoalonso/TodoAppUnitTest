//
//  TodoAppEndToEndTests.swift
//  TodoAppEndToEndTests
//
// Created by Marco Alonso Rodriguez on 10/05/23.
//

import XCTest

class when_app_is_launched: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        
        Springboard.deleteApp()
    }

    func test_should_not_display_any_tasks() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(0, taskList.cells.count)
    }
}

class when_user_saves_a_new_task: XCTestCase {
    
    var app: XCUIApplication!
    
    override  func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        
        Springboard.deleteApp()
        
    }
    
    func test_should_be_able_to_display_task_successfully() {
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let taskBodyTextField = app.textFields["taskBodyTextField"]
        taskBodyTextField.tap()
        taskBodyTextField.typeText("The grass is very tall.")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(0, taskList.cells.count)
        
    }
    
    ///Only execute this function to delete an existing task
    func test_should_erase_a_task_only_when_there_are_one_or_more_task(){
        
        let tasklistCollectionView = XCUIApplication().collectionViews["taskList"]
        tasklistCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Medium"]/*[[".cells.staticTexts[\"Medium\"]",".staticTexts[\"Medium\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tasklistCollectionView.buttons["Delete"].tap()
        
        
    }
    
    
    
}
