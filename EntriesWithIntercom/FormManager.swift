//
//  FormManager.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/26/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation
import UIKit

class FormManager {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func findEmptyTextFields(_ textFields: [UITextField]) -> [String] {
        
        var emptyTextFields = [String]()
        for textField in textFields {
            if let text = textField.text {
                if text.isEmpty {
                    emptyTextFields.append(textField.restorationIdentifier!)
                }
            }
        }
    
        return emptyTextFields
    }
    
    static func displayEmptyTextFieldsAlert(_ emptyTextFields: [String], viewController: UIViewController) {
        
        if emptyTextFields.count > 0 {
            let emptyTextFieldsAlertController = UIAlertController(title: "Missing Required Information", message: "All text fields must have values, but the following are empty: \(emptyTextFields.joined(separator: ", ")).  Make sure they all have values and try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            emptyTextFieldsAlertController.addAction(okAction)
            
            viewController.present(emptyTextFieldsAlertController, animated: true, completion: nil)
        }
    }
    
    static func passwordAndConfirmPasswordTextFieldsMatch(passwordTextField: UITextField, confirmPasswordTextField: UITextField) -> Bool {
        
        if passwordTextField.text != confirmPasswordTextField.text {
            return false
        } else {
            return true
        }
    }
    
    static func displayPasswordDontMatchAlert(_ viewController: UIViewController) {
        let nonMatchingPasswordsAlertController = UIAlertController(title: "Non-matching Passwords", message: "Passwords must match.  Try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        nonMatchingPasswordsAlertController.addAction(okAction)
        
        viewController.present(nonMatchingPasswordsAlertController, animated: true, completion: nil)
    }
    
    static func resetForm(textFields: [UITextField], firstResponder: UITextField) {
        DispatchQueue.main.async {
            for textField in textFields {
                textField.text = ""
            }
            
            firstResponder.becomeFirstResponder()
        }
    }
}
