//
//  PersonDetailViewController.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/22/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import MobileCoreServices

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var twitterHandle: UITextField!
    @IBOutlet weak var githubHandle: UITextField!
    
    @IBAction func ImagePicker(sender: UIButton) {
        addImageFromPicker()
    }
    
    var person : Person!
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "myObserver:", name: UITextFieldTextDidChangeNotification, object: nil)
    }
    
    func myObserver(sender : AnyObject) {
        //println("myObserver \(sender)")
        //sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if (person.hasImage()) {
            imageView.image = person.image
            
            imageView.layer.cornerRadius = 15.0
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.blackColor().CGColor
            
//            println("width = \(imageView.frame.size.width)")
//            imageView.layer.cornerRadius = 0.5 * imageView.frame.size.width // assumption: this is a square
            imageView.layer.masksToBounds = true
        }
        
        firstNameText.text = person.firstName
        lastNameText.text = person.lastName
        twitterHandle.text = person.twitterHandle
        githubHandle.text = person.githubHandle
        
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        self.twitterHandle.delegate = self
        self.githubHandle.delegate = self
    }
    
    /*
     * update the person instance with the current values
     */
    override func viewWillDisappear(animated: Bool) {
        person.firstName = firstNameText.text
        person.lastName = lastNameText.text
        person.twitterHandle = twitterHandle.text
        person.githubHandle = githubHandle.text
//        person.image = ?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addImageFromPicker() {
        println("addImageFromPicker")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.mediaTypes = [kUTTypeImage]
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    
//MARK: - UITextFieldDelegate
    
    /*
     * If we touch outside of a text field then stop editing, keyboard hides
     */
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
//        println("\(touches)")
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        println("did begin editing")
        println("view.bounds = \(view.bounds)")
        
        var x = self.view.bounds.origin.x
        var y = self.view.bounds.origin.y + 100
        var width = self.view.bounds.width
        var height = self.view.bounds.height
        
        UIView.animateWithDuration(0.3) {
            self.view.bounds = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
        println("did end editing")
        println("view.bounds = \(view.bounds)")
        
        var x = self.view.bounds.origin.x
        var y = self.view.bounds.origin.y - 100
        var width = self.view.bounds.width
        var height = self.view.bounds.height
        
        UIView.animateWithDuration(0.3) {
            self.view.bounds = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    /*
     * Return key hides keyboard
     */
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
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
