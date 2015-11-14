//
//  MyAccountViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-05.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet var profileImageView: UIImageView!
    
    var profileImagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func profileImageChangeButtonClicked(sender: AnyObject) {
        //Set delegate of profileImagePicker
        self.profileImagePicker.delegate = self
        self.profileImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(self.profileImagePicker, animated: true, completion: nil)
    }
    
    /****
    UIImagePickerController methods:
    ****/
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //Set current image
        self.profileImageView.image = chosenImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
