//
//  Constants.swift
//  AdminX
//
//  Created by Devang Patel on 22/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import Foundation

internal let users = ["Harjyot Bagga","Gagan Varma","Urvisha","Devang Patel","Soham"]

internal let uid = ["harjyot_","gagan_16","urvisha","devang.p","soham_123"]

internal var status = ["disable","disable","disable","disable","disable"]

internal var url = "http://192.168.43.2:8080/api/"

internal let header = "qwertyuiop"


struct Login: Encodable {
    let name: String
}
