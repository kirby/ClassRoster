//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaultRoster = [
        ["John", "Clem"],
        ["Brad", "Johnson"],
        ["Victor", "Adu"],
        ["Kirby", "Shabaga"],
        ["Collin", "Atherton"],
        ["Jeff", "Gayle"],
        ["Dan", "Hoang"],
        ["Mike", "Tirenin"],
        ["Alex", "Rice"],
        ["Leonardo", "Lee"]
        ]
    
    var roster = Array<Person>()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.roster = loadRosterFromPlist()
//        for person in defaultRoster {
//            roster.append(Person(firstName: person[0], lastName: person[1]))
//        }
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printRoster() {
        for person in roster {
            println("\(person.fullName())")
        }
    }
    
    func loadRosterFromPlist() -> Array<Person> {
        
        var roster = Array<Person>()
        let path = NSBundle.mainBundle().pathForResource("defaultRoster", ofType: "plist")
        let dict = NSArray(contentsOfFile: path)
        
        for object in dict {
            if let dictionary = object as? Dictionary<String, String> {
                let firstName = dictionary["first"]
                let lastName = dictionary["last"]
                roster.append(Person(firstName: firstName!, lastName: lastName!))
            }
        }
        
        //self.roster = roster
        return roster
    }

}

