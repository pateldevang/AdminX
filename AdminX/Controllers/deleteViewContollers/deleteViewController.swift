//
//  deleteViewController.swift
//  AdminX
//
//  Created by Devang Patel on 22/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var arr:[String] = []
class deleteViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableFooterView = UIView()
                let headers: HTTPHeaders = ["Authorization":"Bearer qwertyuiop"]
        
        Alamofire.request(url+"auth/controllers/getAllUsers", method: .post,headers: headers).responseJSON { (response) in
            
            if (response.result.isSuccess) {
                let json = JSON(response.result.value!)
//                                print(json)
             
                var number = 0

                while (number < json["payload"]["msg"].count) {
                    arr.append(json["payload"]["msg"][number].stringValue)
                    print(arr)
//                    print(json["payload"]["msg"])
                    number += 1
                }
                self.table.reloadData()
                
            }
            else if(response.error != nil) {
                print(response.error)
            }
            
        }
        
        
//        let login = [["name":"sarthak"]]
//        let headers: HTTPHeaders = ["Authorization":"Bearer qwertyuiop"]
//
//        let parameters: Parameters = ["name":"sarthak"]
//        print(parameters)
//        Alamofire.request(url+"auth/controllers/deleteUser",method: .post,parameters: parameters,encoding: JSONEncoding.default,headers: headers).responseJSON { response in
//            debugPrint(response)
//        }
        
        
        
        
        

    }
   
    

}

//MARK: - Extensions

extension deleteViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! deleteCellTableViewCell
        cell.name.text = arr[indexPath.row]
        return cell
    }
    
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
        
    
            let deleteRowAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "Delete", handler:{action, indexpath in
                self.table.isEditing = false
            })
                let login = ["name":arr[indexPath.row]]
                let headers: HTTPHeaders = ["Authorization":"Bearer qwertyuiop"]
        
                Alamofire.request(url+"auth/controllers/deleteUser",method: .post,parameters: login,encoding: JSONEncoding.default,headers: headers).responseJSON { response in
                    debugPrint(response)
                    arr.remove(at: indexPath.row)
                    self.table.reloadData()
                }
        
            return [deleteRowAction]
        
        
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
