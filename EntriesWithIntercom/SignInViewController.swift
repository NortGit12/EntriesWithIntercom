//
//  SignInViewController.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/25/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Firebase
import UIKit

class SignInViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text
            , let password = passwordTextField.text {
            
            let empytyTextFields = FormManager.findEmptyTextFields([emailTextField, passwordTextField])
            if empytyTextFields.count > 0 {
                FormManager.displayEmptyTextFieldsAlert(empytyTextFields, viewController: self)
                return
            }
            
            FormManager.resetForm(textFields: [emailTextField, passwordTextField], firstResponder: emailTextField)
            
            FirebaseManager.signInWithEmail(email, password: password, viewController: self) {
                
                TransitionManager.transitionToViewController(sourceViewController: self, destinationStoryboardName: "Main", destinationViewControllerIdentifier: "MainViewNagivationController")
            }
        }
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        if FIRAuth.auth()?.currentUser != nil {
            TransitionManager.transitionToViewController(sourceViewController: self, destinationStoryboardName: "Main", destinationViewControllerIdentifier: "MainViewNagivationController")
        }
    }
}
