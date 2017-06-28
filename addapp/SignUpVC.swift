//
//  SignUpVC.swift
//  addapp
//
//  Created by Danny Daniil on 6/26/17.
//  Copyright © 2017 Daniil, Daniel Chris. All rights reserved.
//

import UIKit
import CoreData


class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var profilePicture: RoundImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var workNumberTextField: UITextField!
    @IBOutlet weak var LinkedInTextField: UITextField!
    @IBOutlet weak var SnapchatTextField: UITextField!
    @IBOutlet weak var InstagramTextField: UITextField!
    @IBOutlet weak var facebookTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    //user can pick image
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //photo picker delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // photo picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePicture.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickProfilePicture(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true, completion: nil)
    }
 
    @IBAction func doneBtnPressed(_ sender: Any) {
     //create entity to be saved
     let user = User(context: context)
     
     
     //save the attributes
     if let firstName = firstNameTextField.text {
     user.firstName = firstName
     user.isRegistered = true
     }
     if let lastName = lastNameTextField.text {
     user.lastName = lastName
     }
     if let mobileNumber = mobileNumberTextField.text {
     user.mobileNumber = mobileNumber
     }
     if let workNumber = workNumberTextField.text {
     user.workNumber = workNumber
     }
     if let email = emailTextField.text {
     user.email = email
     }
     if let facebookUsername = facebookTextField.text {
     user.facebook = facebookUsername
     }
     if let snapchatUsername = SnapchatTextField.text {
     user.snapchat = snapchatUsername
     }
     if let instagramUsername = InstagramTextField.text {
     user.instagram = instagramUsername
     }
     if let linkedInUsername = LinkedInTextField.text {
     user.linkedin = linkedInUsername
     }
    if let selectedProfilePic = profilePicture.image {
            user.profilePicture = UIImagePNGRepresentation(selectedProfilePic) as NSData?
        
    }
    
    
     
     ad.saveContext()
     //performSegue(withIdentifier: "HomeVC", sender: nil)
     dismiss(animated: true, completion: nil)
     }

}