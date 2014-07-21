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

    func test_Person_init_NotNil() {
        var person = Person(firstName: "Kirby", lastName: "Shabaga")
        XCTAssertNotNil(person, "person can not be created")
    }
    
    func test_PersonInit_firtName_equal() {
        var first = "Kirby"
        var last = "Shabaga"
        var person = Person(firstName: first, lastName: last)
        XCTAssertEqual(person.firstName, first, "person.firstName != firstName")
    }
    
    func test_PersonInit_lastName_equal() {
        var first = "Kirby"
        var last = "Shabaga"
        var person = Person(firstName: first, lastName: last)
        XCTAssertEqual(person.lastName, last, "person.lastName != lastName")
    }
    
    func test_PersonInit_image_nil() {
        var person = Person(firstName: "Kirby", lastName: "Shabaga")
        XCTAssertNil(person.image, "image should be nil")
    }
    
    func test_Person_FullName_equal() {
        var first = "Kirby"
        var last = "Shabaga"
        var person = Person(firstName: first, lastName: last)
        XCTAssertEqual(person.fullName(), first + " " + last, "fullName is not matching")
    }
    
    func test_Person_Image_NotNil() {
        var person = Person(firstName: "Kirby", lastName: "Shabaga")
        person.image = UIImage()
        XCTAssertNotNil(person.image, "image is not being set")
    }

}
