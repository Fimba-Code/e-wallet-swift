//
//  ViewController.swift
//  e-Walle
//
//  Created by Marcos Vicente on 24.07.2020.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    
    @IBAction func signInOnTouchUpInside(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        signInButton.layer.cornerRadius = 10
        navigationController?.setNavigationBarHidden(true, animated: true)
        overrideUserInterfaceStyle = .light
    }
    
}

