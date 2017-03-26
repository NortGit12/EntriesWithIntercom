//
//  Firebase.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/26/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Firebase
import UIKit

class FirebaseManager {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func evaluateCreateUserError(_ error: Error?, viewController: UIViewController) {
        
        if let error = error, let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            
            var errorMessage: String!
            switch errorCode {
            case .errorCodeInvalidEmail:
                errorMessage = "The format of the e-mail is invalid.  Try again."
            case .errorCodeEmailAlreadyInUse:
                errorMessage = "An account already exists with this e-mail.  Sign in with that account or create a new one."
            default:
                errorMessage = "Error signing in: \(error.localizedDescription)"
            }
            NSLog(errorMessage)
            
            let errorAlertController = UIAlertController(title: "Sign In Error", message: errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            errorAlertController.addAction(okAction)
            viewController.present(errorAlertController, animated: true, completion: nil)
            
            return
        }
    }
    
    static func signInWithEmail(_ email: String, password: String, viewController: UIViewController, completion: (() -> Void)? = nil) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if let error = error, let errorCode = FIRAuthErrorCode(rawValue: error._code) {
                
                let errorMessage = "Error signing in (\(errorCode)): \(error.localizedDescription)"
                NSLog(errorMessage)
                
                let errorAlertController = UIAlertController(title: "Sign In Error", message: errorMessage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                errorAlertController.addAction(okAction)
                viewController.present(errorAlertController, animated: true, completion: nil)
                
                if let completion = completion {
                    completion()
                }
                
                return
            }
        })
    }
}
