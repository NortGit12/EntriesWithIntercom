//
//  SignUpViewController.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/25/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if let name = nameTextField.text
            , let email = emailTextField.text
            , let password = passwordTextField.text {
            
            FormManager.evaluateTextFieldsForEmptiness(textFields: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField], viewController: self)
            FormManager.evaluateMatchingPasswordTextFields(passwordTextField: passwordTextField, confirmPasswordTextField: confirmPasswordTextField, viewController: self)
            FormManager.resetForm(textFields: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField], firstResponder: nameTextField)
            
            // Create the user in Firebase
            FIRAuth.auth()!.createUser(withEmail: email, password: password, completion: { (user, error) in
                FirebaseManager.evaluateCreateUserError(error, viewController: self)
                
                // Add some extra profile details
                let userProfileData = [
                    "email": email
                    , "name": name
                ]
                
                // Add user profile 
                if let user = user {
                    
                    let usersRef = FIRDatabase.database().reference().child("users")
                    usersRef.child(user.uid).setValue(userProfileData)
                    
                    // Sign in
                    FirebaseManager.signInWithEmail(email, password: password, viewController: self) {
                        
                        TransitionManager.transitionToViewController(sourceViewController: self, destinationStoryboardName: "Main", destinationViewControllerIdentifier: "MainViewNagivationController")
                    }
                }
            })
        }
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
