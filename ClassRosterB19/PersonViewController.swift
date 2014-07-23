//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/21/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView : UITableView?
    var roster = Array<Person>()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        roster = loadRosterFromPlist()
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printRoster() {
        for person in self.roster {
            println("\(person.fullName())")
        }
    }
    
    func loadRosterFromPlist() -> Array<Person> {
        var roster = Array<Person>()
        let path = NSBundle.mainBundle().pathForResource("defaultRoster", ofType: "plist")
        let arr = NSArray(contentsOfFile: path)
        
        for object in arr {
            if let person = object as? Dictionary<String, String> {
                let firstName = person["first"] as String
                let lastName = person["last"] as String
                let image = person["image"] as String
                var person = Person(firstName: firstName, lastName: lastName)
                person.setImage(UIImage(named: image))
                roster.append(person)
            }
        }
        return roster
    }
    
//MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView!,
        numberOfRowsInSection section: Int) -> Int {
            return roster.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as PersonViewCell
        
        cell.fullNameLabel.text = roster[indexPath.row].fullName()
        //cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        if (roster[indexPath.row].hasImage()) {
            cell.personImage.image = roster[indexPath.row].image
        }
        return cell
    }

//MARK: - UITableViewDelegate
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        if let segueId = segue.identifier {
            println("\(segueId)")
            switch segueId {
            case "AddPersonSegue":
                let destVC = segue.destinationViewController as PersonDetailViewController
                let emptyPerson = Person(firstName: "", lastName: "")
                roster.append(emptyPerson)
                destVC.person = emptyPerson
            case "ShowDetailSegue":
                let destVC = segue.destinationViewController as PersonDetailViewController
                destVC.person = roster[tableView!.indexPathForSelectedRow().row]
            case "ShowDetailDisclosureSegue":
                let destVC = segue.destinationViewController as PersonDetailViewController
                let cell = tableView!.indexPathForCell(sender as? PersonViewCell)
                let row = cell.row
                destVC.person = roster[row]
            default:
                let destVC = segue.destinationViewController as PersonDetailViewController
                //destVC.person = roster[tableView!.indexPathForSelectedRow().row]
        }
        }
        
//        if (segue.identifier == "ShowDetailSegue") {
//            let destVC = segue.destinationViewController as PersonDetailViewController
//            destVC.person = roster[tableView!.indexPathForSelectedRow().row]
//        } else if (segue.identifier == "AddPersonSegue") {
//            let destVC = segue.destinationViewController as PersonDetailViewController
//            let emptyPerson = Person(firstName: "", lastName: "")
//            roster.append(emptyPerson)
//            destVC.person = emptyPerson
//        }
    }
}

