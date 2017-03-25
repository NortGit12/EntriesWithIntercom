//
//  MainViewController.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/25/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var EnterButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        
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
