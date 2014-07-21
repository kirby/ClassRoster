//
//  ViewControllerTests.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTests: XCTestCase {

    var controller = ViewController(coder: nil)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_ViewController_init_notNil() {
        XCTAssertNotNil(self.controller, "controller should not be nil")
    }
    
    func test_ViewControllerInit_roster_notNil() {
        XCTAssertNotNil(self.controller.roster, "roster should not be nil")
    }
    
    func test_ViewControllerInit_roster_countGtZero() {
        XCTAssert(controller.roster.count == 10, "default roster count should be 10")
    }
    
    // this isn't a real test, no assertion, just a helper for me
    func test_ViewControllerInit_printRoster() {
        self.controller.printRoster()
    }
    
    func test_ViewController_loadRosterFromPlist() {
        self.controller.loadRosterFromPlist()
        XCTAssertNotNil(self.controller.roster, "roster should not be nil")
    }

}
