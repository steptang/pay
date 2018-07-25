//
//  Items.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation

class Item: NSObject {
    var name: String?
    var cost: Double
    var claimed: Bool
    var owner: User
    
    init(name: String, cost: Double){
        self.name = name
        self.cost = cost
        self.claimed = false
        self.owner = User(username: "", name: "", email: "", phoneNumber: 0, password: "")
    }
    
    func changeUser(user: User){
        self.owner = user
        self.claimed = true
    }

}
