//
//  Person.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
    var firstName : String
    var lastName : String
    var twitterHandle : String?
    var githubHandle : String?
    var image : UIImage?
    
    init(firstName: String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return self.firstName + " " + self.lastName
    }
    
    func setImage(image : UIImage) {
        self.image = image
    }
    
    func hasImage() -> Bool {
        if (image != nil) {
            return true
        } else {
            return false
        }
    }
    
}