//
//  CustomCells.swift
//  eWalle-test
//
//  Created by Marcos Vicente on 23.07.2020.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var avatar: String? {
        didSet {
            avatarImageView.image = UIImage(named: avatar!)
        }
    }
    
    var name: String? {
        didSet {
            nameLabel.text = name!
        }
    }
}

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var selectionLine: UIView!
    
    var sectionName: String? {
        didSet {
            section.text = sectionName
        }
    }
}
