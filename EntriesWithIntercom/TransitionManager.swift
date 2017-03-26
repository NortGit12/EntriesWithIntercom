//
//  TransitionManager.swift
//  EntriesWithIntercom
//
//  Created by Jeff Norton on 3/26/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation
import UIKit

class TransitionManager {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func transitionToViewController(sourceViewController: UIViewController, destinationStoryboardName: String, destinationViewControllerIdentifier: String) {
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: destinationStoryboardName, bundle: nil)
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: destinationViewControllerIdentifier)
            sourceViewController.present(destinationViewController, animated: true, completion: nil)
        }
    }
}
