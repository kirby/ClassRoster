//
//  PersonDetailViewController.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/22/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var person : Person!
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstNameText.text = person.firstName
        lastNameText.text = person.lastName
        if (person.hasImage()) {
            imageView.image = person.image
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        person.firstName = firstNameText.text
        person.lastName = lastNameText.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
