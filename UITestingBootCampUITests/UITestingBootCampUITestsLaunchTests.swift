//
//  UITestingBootCampUITestsLaunchTests.swift
//  UITestingBootCampUITests
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import XCTest

final class UITestingBootCampUITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    @MainActor
    func testLaunch() throws {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func test_loginView_InvalidUser() {
        
        // Given
        let usernameField = app.textFields["Username"]
        let loginButtonn = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText("someone")
        loginButtonn.tap()
        let alert = app.alerts["Boot Camp"]
        
        // Then
        assert(alert.exists, "Invalid user test passed successfully")
    }
    
    func test_loginView_SuccessfulLogin() {
        
        // Given
        let usernameField = app.textFields["Username"]
        let loginButtonn = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText("someone@email.com")
        loginButtonn.tap()
        let navigationBar = app.navigationBars["Home"]

        // Then
        assert(navigationBar.exists, "Succesfull user test passed")
    }
}
