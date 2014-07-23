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
    
    @IBAction func addPerson(sender: UIBarButtonItem) {
        addPerson()
    }
    
    var roster = Array<Person>()
    
// ------------------------------------------
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        roster = loadRosterFromPlist()
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView!.delegate = self
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
            if let info = object as? Dictionary<String, String> {
                
                let firstName = info["first"] as String
                let lastName = info["last"] as String
                var person = Person(firstName: firstName, lastName: lastName)
                
                if let image = info["image"] as? String {
                    person.setImage(UIImage(named: image))
                }
                if let twitter = info["twitter"] as? String {
                    person.twitterHandle = twitter
                }
                if let github = info["github"] as? String {
                    person.githubHandle = github
                }
                
                roster.append(person)
            }
        }
        return roster
    }
    
    func addPerson() {
        
        var emptyPerson = Person(firstName: "", lastName: "")
        emptyPerson.githubHandle = "https://github.com/"
        emptyPerson.twitterHandle = "@"
        emptyPerson.image = UIImage(named: "silhouette.jpeg")
        
        roster.append(emptyPerson)
        if let detailVC = self.storyboard.instantiateViewControllerWithIdentifier("PersonDetail") as? PersonDetailViewController {
            detailVC.person = emptyPerson
            self.navigationController.pushViewController(detailVC, animated: true)
        }
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
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if let detailVC = self.storyboard.instantiateViewControllerWithIdentifier("PersonDetail") as? PersonDetailViewController {
            detailVC.person = roster[indexPath.row]
            self.navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
}

