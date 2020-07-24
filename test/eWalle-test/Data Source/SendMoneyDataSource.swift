//
//  SendMoneyCollectionViewDataSource.swift
//  eWalle-test
//
//  Created by Marcos Vicente on 12.07.2020.
//

import UIKit


class SendMoneyDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    private(set) var collectionView: UICollectionView
    
    private(set) var avatars: [String]?
    private(set) var names: [String]?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func setup() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func reload() {
        
        self.avatars = [ "avatar-1", "avatar-2", "avatar-1", "avatar-2", "avatar-1", "avatar-2"]
        self.names = [ "Mike", "Joshseph", "Ashley", "Mike", "Joshseph", "Ashley"]
        self.collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return avatars?.count == names?.count ? avatars!.count : 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddButtonCell", for: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell
            
            cell.avatar = avatars![indexPath.item]
            cell.name = names![indexPath.item]
            
            return cell
        }

    }

}
