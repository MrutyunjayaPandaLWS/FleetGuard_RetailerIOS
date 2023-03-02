//
//  Fleet_Guard_Samriddhi_UITestsLaunchTests.swift
//  Fleet_Guard(Samriddhi)UITests
//
//  Created by ADMIN on 16/01/2023.
//

import XCTest

final class Fleet_Guard_Samriddhi_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
