//
//  userTabBarViewController.swift
//  AdminX
//
//  Created by Devang Patel on 22/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class userTabBarViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableFooterView = UIView()
    }

}

//MARK: - Extensions

extension userTabBarViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! userTabTableViewCell
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
        return 20
    }
    
    //Did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToUserDetails", sender: Any.self)
    }
    
    // Setting custom header properties
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(ciColor: .white)
        headerView.tintColor = .white
        return headerView
    }
    
}

