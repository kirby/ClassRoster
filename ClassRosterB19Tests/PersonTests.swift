//
//  PersonTests.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest

class PersonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPersonCreation() {
        var person = Person(firstName: "Kirby", lastName: "Shabaga")
        XCTAssertNotNil(person, "person can not be created")
    }
    
    func testFirstName() {
        var person = Person(firstName: "Kirby", lastName: "Shabaga")
        XCTAssertNotNil(person.firstName, "person's first name property could not be created")
    }
    
    func testFirstNameInit() {
        var person = Person(firstName:"Kirby", lastName:"Shabaga")
        XCTAssertNotNil(person, "person can not be created")
    }
    
    func testFullName() {
        var first = "Kirby"
        var last = "Shabaga"
        
        var person = Person(firstName: first, lastName: last)
        
        XCTAssertEqual(person.fullName(), first + last, "fullName is not matching")
    }

}
