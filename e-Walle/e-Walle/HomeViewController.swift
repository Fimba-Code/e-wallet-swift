//
//  HomeViewController.swift
//  e-Walle
//
//  Created by Marcos Vicente on 24.07.2020.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userCornerView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var homeScreenView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func showMenuOnTouchUpInside(_ sender: Any) {
        let scale = CGAffineTransform(scaleX: 0.7, y: 0.7)
        let scaleThenTranslate = scale.translatedBy(x: 270, y: 0)
        let translateThenRotate = scaleThenTranslate.rotated(by: -0.25)
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       options: .curveEaseIn) {
            self.homeScreenView.transform = scale
            self.homeScreenView.transform = scaleThenTranslate
            self.homeScreenView.transform = translateThenRotate
        } completion: { (_) in }
    }
    
    @IBAction func exitMenuOnTouchUpInside(_ sender: Any) {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       options: .curveEaseOut) {
            self.homeScreenView.transform = CGAffineTransform.identity
        } completion: { (_) in }
    }
    
    @IBAction func goBackOnTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var collectionDataSource: CollectionViewDataSource?
    var menuDataSource: MenuDataSource = MenuDataSource()
    var menuSections: [String] = [ "Home", "Profile", "Accounts", "Transactions", "Stats", "Settings", "Help"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupDataSource()
    }
    
    func setupUI() {
        overrideUserInterfaceStyle = .light
        userCornerView.round(corners: .bottomRight, cornerRadius: 53.5)
        homeScreenView.layer.cornerRadius = 30
        
        menuDataSource.showHomeScreen = { show in
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut) {
                
                self.homeScreenView.transform = CGAffineTransform.identity
            } completion: { (_) in }
        }
    }
    
    func setupDataSource() {
        menuTableView.delegate = menuDataSource
        menuTableView.dataSource = menuDataSource
        menuDataSource.data = menuSections
        self.menuTableView.reloadData()
        
        collectionDataSource = CollectionViewDataSource(collectionView: collectionView)
        collectionDataSource?.setup()
        collectionDataSource?.reload()
    }

}
