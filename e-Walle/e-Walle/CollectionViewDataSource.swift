//
//  CollectionViewDataSource.swift
//  e-Walle
//
//  Created by Marcos Vicente on 25.07.2020.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private(set) var collectionView: UICollectionView
    
    private(set) var avatars: [String]?
    private(set) var names: [String]?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func setup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func reload() {
        self.avatars = [ "avatar-1", "avatar-2", "avatar-1", "avatar-2", "avatar-1", "avatar-2"]
        self.names = [ "Mike", "Joshseph", "Ashley", "Mike", "Joshseph", "Ashley"]
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars?.count == names?.count ? avatars!.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddButtonCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell
            
            cell.userAvatar = avatars![indexPath.item]
            cell.personName = names![indexPath.item]
            
            return cell
        }
    }
}
