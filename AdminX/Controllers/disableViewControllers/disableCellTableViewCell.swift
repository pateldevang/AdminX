//
//  disableCellTableViewCell.swift
//  AdminX
//
//  Created by Devang Patel on 22/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class disableCellTableViewCell: UITableViewCell {

    
    //MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
