//
//  UserDatabase.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation

class UserDatabase: NSObject {
    //array of Users
    static var allUserList = [User]()
    
    //returns number of Users
    static func numUsers() -> Int{
        return allUserList.count
    }
    
    //get User at index
    static func getUser(index: Int) -> User {
        return allUserList[index]
    }
    
    //get User at index
    static func getUserFromUsername(username: String) -> User {
        for i in 0...allUserList.count-1 {
            if(allUserList[i].username == username){
                return allUserList[i]
            }
        }
        return User(username: "", name: "", email: "", phoneNumber: 0, password: "")
    }
    
    //add array of Users
    static func addUsers(UserArray: [User]) {
        allUserList = UserArray
    }
    
    //add User
    static func addUser(User: User) {
        allUserList.append(User)
    }
    
    //clear Users
    static func clearUsers() {
        allUserList = []
    }
    
    static func containsUsername(username: String) -> Bool{
        for i in 0...allUserList.count-1 {
            if(allUserList[i].username == username){
                return true
            }
        }
        return false
    }
    
    static func containsEmail(email : String) -> Bool{
        for i in 0...allUserList.count-1{
            if(allUserList[i].email == email){
                return true
            }
        }
        return false
    }
    
    static func containsPhone(phone : Int) -> Bool{
        for i in 0...allUserList.count-1{
            if(allUserList[i].phoneNumber == phone){
                return true
            }
        }
        return false
    }
}
