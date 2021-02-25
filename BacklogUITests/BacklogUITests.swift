//
//  BacklogUITests.swift
//  BacklogUITests
//
//  Created by Aaron Kiser on 2/25/21.
//

import XCTest

class BacklogUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginLogout() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let emailTextfield = app.textFields["Enter Email:"]
        let passwordTextfield = app.secureTextFields["Enter Password:"]
        let loginButton = app.buttons.matching(identifier: "Login")
        
        emailTextfield.tap()
        emailTextfield.typeText("test@test.com")
        
        passwordTextfield.doubleTap()
        app.waitForExistence(timeout: 10)
        UIPasteboard.general.string = "test12"
        passwordTextfield.doubleTap()
        app.menuItems["Paste"].tap()
        
        app.waitForExistence(timeout: 10)
        loginButton.element(boundBy: 1).doubleTap()
        app.waitForExistence(timeout: 10)
        
        app.collectionViews.cells.element(boundBy: 0).tap()
    
        app.waitForExistence(timeout: 10)
        app.buttons.element(boundBy: 0).doubleTap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
