//
//  MenuCell.swift
//  e-Walle
//
//  Created by Marcos Vicente on 24.07.2020.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var selectionLine: UIView!
    @IBOutlet weak var sectionName: UILabel!
    
    var section: String? {
        didSet {
            sectionName.text = section
        }
    }
}
