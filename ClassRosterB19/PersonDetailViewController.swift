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
    @IBOutlet weak var twitterHandle: UITextField!
    @IBOutlet weak var githubHandle: UITextField!
    @IBOutlet weak var imageButton: UIButton!
    
    // Constraints
    @IBOutlet weak var constraintButtonCenterX: NSLayoutConstraint!
    
    // + add person to roster button
    @IBAction func ImagePicker(sender: UIButton) {
        addImageFromPicker()
    }
    
    let debug = true
    
    let keyboardHeight = 160 // just guessing for iPhone 5/5s; what is it for iPhone 4
    var yPadding = 35
    
    var boundsModified = false
    var boundsOffset = 0
    var device : UIDevice!
    
    var person : Person!
    var imagePicker = UIImagePickerController()
    var image = UIImage(named: "silhouette.jpeg")
    var imageDefault = UIImage(named: "silhouette.jpeg")   // default image
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        // which device am I running on?
        // and please generate device orientation notifcations
        device = UIDevice.currentDevice()
        device.beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceRotation:", name: UIDeviceOrientationDidChangeNotification, object: nil)
        // if this is an iPad - lay it out differently
        if (device.name.hasPrefix("iPad")) {
            kprint("iPad detected")
        }
    }
    
    // We know the device was rotated, let's modify constraints as needed
    func deviceRotation(sender : AnyObject) {
        kprint("deviceRotation")
        if (device.orientation.isLandscape) {
            kprint("landscape")
        } else if (device.orientation.isPortrait) {
            kprint("portrait")
        }
    }
    
    func kprint(str : String) {
        if debug {
            println(str)
        }
    }

    /*
     * viewDidLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        }

        if (person.hasImage()) {
            imageButton.setImage(person.image, forState: UIControlState.Normal)
            imageButton.setImage(person.image, forState: UIControlState.Highlighted)

        } else {
            imageButton.setImage(imageDefault, forState: UIControlState.Normal)
            imageButton.setImage(imageDefault, forState: UIControlState.Highlighted)
        }
        imageButton.imageView.layer.cornerRadius = 15.0
        imageButton.imageView.layer.borderWidth = 1.0
        imageButton.imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageButton.imageView.layer.masksToBounds = true
        
        firstNameText.text = person.firstName
        lastNameText.text = person.lastName
        twitterHandle.text = person.twitterHandle
        githubHandle.text = person.githubHandle
        
        firstNameText.delegate = self
        lastNameText.delegate = self
        twitterHandle.delegate = self
        githubHandle.delegate = self
    }
    
    /*
     * update the person instance with the current values
     */
    override func viewWillDisappear(animated: Bool) {
        person.firstName = firstNameText.text
        person.lastName = lastNameText.text
        person.twitterHandle = twitterHandle.text
        person.githubHandle = githubHandle.text
        person.image = imageButton.imageView.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * addImageFromPicker
     */
    func addImageFromPicker() {
        if debug {
            println("addImageFromPicker")
        }
        presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
//MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        image = info[UIImagePickerControllerOriginalImage] as UIImage
        // UIImagePickerControllerMediaURL
        // UIImagePickerControllerReferenceURL
        // UIImagePickerControllerMediaMetadata
        
        if debug {
            for i in info {
                println("\(i)\n")
            }
        }

        let metadata: AnyObject? = info[UIImagePickerControllerReferenceURL]
        person.imageURL = metadata as? String
        
        imageButton.setImage(image, forState: UIControlState.Normal)
        imageButton.setImage(image, forState: UIControlState.Highlighted)
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
//MARK: - UITextFieldDelegate
    
    /*
     * If we touch outside of a text field then stop editing, keyboard hides
     */
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {

        kprint("did begin editing")
        kprint("keyboardHeight = \(keyboardHeight)")
        kprint("yPadding = \(yPadding)")
//        kprint("view.bounds = \(view.bounds)")
        kprint("view.frame.height = \(view.frame.height)")
        kprint("textField.frame.origin.y = \(textField.frame.origin.y)")
        
        // if textField is below the keyboard then change the view bounds so we can see the textField
        
        var overTheLine = Double(self.view.frame.height) - Double(keyboardHeight) - Double(yPadding)
        kprint("overTheLine = \(overTheLine)")
        
        if ( Double(textField.frame.origin.y) > overTheLine ) {
            kprint("****")
            boundsModified = true
            
            var x = self.view.bounds.origin.x
//            var y = self.view.bounds.origin.y + getYPadding()
            boundsOffset = Int(textField.frame.origin.y) - Int(overTheLine)
            var y = self.view.bounds.origin.y + boundsOffset
            var width = self.view.bounds.width
            var height = self.view.bounds.height
            
            UIView.animateWithDuration(0.3) {
                self.view.bounds = CGRect(x: x, y: y, width: width, height: height)
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {

        kprint("did end editing")
        kprint("view.bounds = \(view.bounds)")
        kprint("textField.frame.origin.y = \(textField.frame.origin.y)")
    
        if (boundsModified) {
            var x = self.view.bounds.origin.x
//            var y = self.view.bounds.origin.y - getYPadding()
            var y = self.view.bounds.origin.y - boundsOffset
            var width = self.view.bounds.width
            var height = self.view.bounds.height
            
            UIView.animateWithDuration(0.3) {
                self.view.bounds = CGRect(x: x, y: y, width: width, height: height)
            }
            boundsModified = false
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
