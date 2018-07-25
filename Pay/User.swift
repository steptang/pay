
//
//  User.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation
import Firebase

class User: NSObject {
    var key: String
    var username: String?
    var name: String?
    var email: String?
    var phoneNumber: Int?
    var password: String?
    var balance: Double?
    let ref: FIRDatabaseReference?
    
    init(username: String, name: String, email: String, phoneNumber: Int, password: String){
        self.key = ""
        self.username = username
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        self.ref = nil
        self.balance = 0.0
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.username = snapshotValue["username"] as? String
        self.name = snapshotValue["name"] as? String
        self.password = snapshotValue["password"] as? String
        self.phoneNumber = snapshotValue["phone"] as? Int
        self.email = snapshotValue["email"] as? String
        self.balance = snapshotValue["balance"] as? Double
        self.ref = snapshot.ref
        super.init()
    }
    
    func toAnyObject() -> Any {
        return [
            "email": email!,
            "name": name!,
            "password": password!,
            "phone": phoneNumber!,
            "username": username!,
            "balance": balance!
        ]
    }
}
