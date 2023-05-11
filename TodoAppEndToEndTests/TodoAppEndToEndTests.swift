//
//  TodoAppEndToEndTests.swift
//  TodoAppEndToEndTests
//
// Created by Marco Alonso Rodriguez on 10/05/23.
//

import XCTest

// MARK:  App Launched
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




// MARK:  Add New Task
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
        XCTAssertEqual(1, taskList.cells.count)
        
    }
    
    func test_display_error_message_for_duplicate_title_tasks() {
        
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Study SwiftUI and make apps")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
        
        titleTextField.tap()
        titleTextField.typeText("Study SwiftUI and make apps")
        
        saveTaskButton.tap()
        
        //If want to know how many tasks there are
//        let taskList = app.tables["taskList"]
//        XCTAssertEqual(1, taskList.cells.count)
        
        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Task is already added")
        
    }
    ///Only execute this function to delete an existing task
//    func test_should_erase_a_task_only_when_there_are_one_or_more_task(){
//
//        let tasklistCollectionView = XCUIApplication().collectionViews["taskList"]
//        tasklistCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Medium"]/*[[".cells.staticTexts[\"Medium\"]",".staticTexts[\"Medium\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
//        tasklistCollectionView.buttons["Delete"].tap()
//
//
//    }
}

// MARK:  Delete
class when_user_deletes_a_new_task_successfully : XCTestCase {
    var app: XCUIApplication!
    
    override  func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        ///Create a task of example
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Study SwiftUI and make apps")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
    }
    
    override func tearDown() {
        super.tearDown()
        Springboard.deleteApp()
    }
    
    
    func test_should_delete_task_successfully(){
        let tasklistCollectionView = XCUIApplication().collectionViews["taskList"]
        tasklistCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Medium"]/*[[".cells.staticTexts[\"Medium\"]",".staticTexts[\"Medium\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tasklistCollectionView.buttons["Delete"].tap()
    }
    
    
}

class when_user_marks_task_as_favorite: XCTestCase {
    private var app: XCUIApplication!
    
    override  func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        ///Create a task of example
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Study SwiftUI and make apps")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
    }
        
    func test_should_displayed_updated_task_on_screen_as_favorite(){
        
        
        app.collectionViews["taskList"].cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.images["favoriteImage"]/*[[".images[\"Love\"]",".images[\"favoriteImage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Study SwiftUI and make apps"]/*@START_MENU_TOKEN@*/.buttons["closeButton"]/*[[".otherElements[\"Close\"]",".buttons[\"Close\"]",".buttons[\"closeButton\"]",".otherElements[\"closeButton\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        XCTAssertTrue(app.collectionViews["taskList"].cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.exists)
    }
    
    override func tearDown() {
        super.tearDown()
        Springboard.deleteApp()
    }
    
}
