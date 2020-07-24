//
//  PersonCell.swift
//  e-Walle
//
//  Created by Marcos Vicente on 25.07.2020.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var personName: String? {
        didSet {
            name.text = personName
        }
    }
    
    var userAvatar: String? {
        didSet {
            avatar.image = UIImage(named: userAvatar!)
        }
    }
}
