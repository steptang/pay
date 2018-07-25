//
//  CurrUser.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation

class CurrUser: NSObject {

    static var currUser = [User]()
    
    static func setCurrUser(user: User){
        if(currUser.count == 0){
            currUser.append(user)
        }
        currUser[0] = user
    }
    
    static func getCurrUser() -> User{
        return currUser[0]
    }
    
    static func clearCurrUser(){
        currUser = []
    }
}
