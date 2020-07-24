//
//  HomeViewController.swift
//  eWalle-test
//
//  Created by Marcos Vicente on 11.07.2020.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sendMoneyCollectionView: UICollectionView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var homeSectionView: UIView!
    @IBOutlet weak var userCornerView: UIView!
    
    @IBAction func goBackToLoginScreenOnTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showMenuOnTouchUpInside(_ sender: Any) {
        
        let scale = CGAffineTransform(scaleX: 0.7, y: 0.7)
        let scaleThenTranslate =  scale.translatedBy(x: 270, y: 0)
        let translateThenRotate = scaleThenTranslate.rotated(by: -0.25)
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       options: .curveEaseIn) {
            
            self.homeSectionView.transform = scale
            self.homeSectionView.transform = scaleThenTranslate
            self.homeSectionView.transform = translateThenRotate
        } completion: { (_) in }
    }
    
    @IBAction func exitMenuOnTouchUpInside(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseOut) {
            
            self.homeSectionView.transform = CGAffineTransform.identity
        } completion: { (_) in }

    }
    
    var sendMoneyDataSource: SendMoneyDataSource?
    var menuDataSource: MenuDataSource = MenuDataSource()
    var menuSections: [String] = [ "Home", "Profile", "Accounts", "Transactions", "Stats", "Settings", "Help"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDataSource()
        self.userCornerView.round(corners: [.bottomRight], cornerRadius: 53.5)
        
        menuDataSource.showHomeScreen = { show in
            if show {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: .curveEaseOut) {
                    
                    self.homeSectionView.transform = CGAffineTransform.identity
                } completion: { (_) in }
            }
        }
    }

    func setupDataSource() {
        sendMoneyDataSource = SendMoneyDataSource(collectionView: sendMoneyCollectionView)
        sendMoneyDataSource?.setup()
        sendMoneyDataSource?.reload()
        
        menuTableView.delegate = menuDataSource
        menuTableView.dataSource = menuDataSource
        menuDataSource.data = menuSections
        self.menuTableView.reloadData()
    }
    
}
