//
//  SignInViewController.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/25/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

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
            
            FormManager.evaluateTextFieldsForEmptiness(textFields: [emailTextField, passwordTextField], viewController: self)
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
