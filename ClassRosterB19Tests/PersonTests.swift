//
//  PersonTests.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest
//import ClassRosterB19

class PersonTests: XCTestCase {

    let first = "Kirby"
    let last = "Shabaga"
    var person = Person(firstName: "Kirby", lastName: "Shabaga")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Person_init_NotNil() {
        XCTAssertNotNil(self.person, "person object can not be created")
    }
    
    func test_PersonInit_firtName_equal() {
        XCTAssertEqual(self.person.firstName, self.first, "firstName property is not equal to first name after object creation")
    }
    
    func test_PersonInit_lastName_equal() {
        XCTAssertEqual(self.person.lastName, self.last, "lastName property is not equal to last name after object creation")
    }
    
    func test_PersonInit_image_nil() {
        XCTAssertNil(self.person.image, "image property should be nil after object creation")
    }
    
    func test_Person_FullName_equal() {
        XCTAssertEqual(self.person.fullName(), self.first + " " + self.last, "fullName property does not equal firstName, lastName after object creation")
    }
    
    func test_Person_setImage_NotNil() {
        var image = UIImage(named: "linkedin.png")
        self.person.image = image
        XCTAssertNotNil(person.image, "image is not being set")
    }
    
    func test_Person_hasImage_false() {
        XCTAssertFalse(person.hasImage(), "person hasImage should not be true")
    }
    
    func test_Person_hasImage_true() {
        var image = UIImage(named: "linkedin.png")
        self.person.image = image
        XCTAssertTrue(person.hasImage(), "person hasImage() should be true")
    }

}
