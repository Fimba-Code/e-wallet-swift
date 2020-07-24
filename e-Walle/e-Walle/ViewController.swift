//
//  ViewController.swift
//  e-Walle
//
//  Created by Marcos Vicente on 24.07.2020.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    func setupUI() {
        signInButton.layer.cornerRadius = 10
    }
    
}

