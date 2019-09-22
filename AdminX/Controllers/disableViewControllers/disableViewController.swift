//
//  disableViewController.swift
//  AdminX
//
//  Created by Devang Patel on 22/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class disableViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableFooterView = UIView()
    }
}

//MARK: - Extensions

extension disableViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! disableCellTableViewCell
        cell.name.text = users[indexPath.row]
        cell.id.text = uid[indexPath.row]
        return cell
    }
    
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    // Setting custom header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    //Did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Setting custom header properties
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(ciColor: .white)
        headerView.tintColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        if status[indexPath.row] == "disable" {
            let deleteRowAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "Enable", handler:{action, indexpath in
                self.table.isEditing = false
//                 self.status[indexPath.row] = "disable"
            })
             status[indexPath.row] = "disable"
            return [deleteRowAction]
        } else {
            let deleteRowAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "Disable", handler:{action, indexpath in
                self.table.isEditing = false
            })
           
            return [deleteRowAction]
        }
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? UITableViewCell.EditingStyle.none : UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
}
