//
//  SettingsViewController.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/25/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Firebase
import UIKit

class SettingsViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        do {
            try FIRAuth.auth()?.signOut()
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signInViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
            present(signInViewController, animated: true, completion: nil)
        } catch let error as NSError {
            NSLog("Error signing out: \(error.localizedDescription)")
            return
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
