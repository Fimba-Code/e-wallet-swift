//
//  ViewController.swift
//  eWalle-test
//
//  Created by Marcos Vicente on 11.07.2020.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBAction func loginOnTouchUpInside(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
}

