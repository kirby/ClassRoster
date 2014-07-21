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
        for person in defaultRoster {
//            println("person = \(person)")
            roster.append(Person(firstName: person[0], lastName: person[1]))
//            println("person.fullName = \(p.fullName())")
        }
//        let path = NSBundle.mainBundle().pathForResource("defaultRoster", ofType: "plist")
//        let dict = NSArray(contentsOfFile: path)
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

