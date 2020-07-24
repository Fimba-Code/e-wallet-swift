//
//  MenuDataSource.swift
//  e-Walle
//
//  Created by Marcos Vicente on 24.07.2020.
//

import UIKit

class MenuDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var data: [String] = [String]()
    var showHomeScreen: ((Bool) -> ())?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        
        cell.section = data[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let tableViewIndexPaths = tableView.indexPathsForVisibleRows else { return }
        
        _ = tableViewIndexPaths.map({ currentIndexPath in
            if currentIndexPath == indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! MenuCell
                cell.selectionLine.isHidden = false
                cell.sectionName.font = UIFont(name: "AvenirNext-Bold", size: 16.0)
                
                if indexPath.row == 0 {
                    showHomeScreen!(true)
                }
                
            } else {
                let cell = tableView.cellForRow(at: currentIndexPath) as! MenuCell
                cell.selectionLine.isHidden = true
                cell.sectionName.font = UIFont(name: "AvenirNext-Medium", size: 16.0)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! MenuCell
        
        if indexPath.row == 0 {
            cell.selectionLine.isHidden = false
            cell.sectionName.font = UIFont(name: "AvenirNext-Bold", size: 16.0)
        }
    }
}
