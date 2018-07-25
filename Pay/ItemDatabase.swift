//
//  ItemDatabase.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation

class ItemDatabase: NSObject {
    
    //array of Items
    static var allItemList = [Item]()
    static var claimedItemList = [Item]()
    
    //returns number of Items
    static func numItems() -> Int{
        return allItemList.count
    }
    
    //get Item at index
    static func getItem(index: Int) -> Item {
        return allItemList[index]
    }
    
    //add array of Items
    static func addItems(ItemArray: [Item]) {
        allItemList = ItemArray
    }
    
    //add Item
    static func addItem(Item: Item) {
        allItemList.append(Item)
        if Item.claimed {
            addClaimedItem(Item: Item)
        }
    }
    
    static func removeItem(name: String) {
        for i in 0...allItemList.count-1 {
            if(allItemList[i].name == name){
                allItemList.remove(at: i)
            }
        }
        for i in 0...claimedItemList.count-1 {
            if(claimedItemList[i].name == name){
                claimedItemList.remove(at: i)
            }
        }
    }
    
    static func removeItemAtIndex(index: Int) {
        allItemList.remove(at: index)
    }
    
    //returns number of Items
    static func numClaimedItems() -> Int{
        return claimedItemList.count
    }
    
    //get Item at index
    static func getClaimedItem(index: Int) -> Item {
        return claimedItemList[index]
    }
    
    //add array of Items
    static func addClaimedItems(ItemArray: [Item]) {
        claimedItemList = ItemArray
    }
    
    //add Item
    static func addClaimedItem(Item: Item) {
        claimedItemList.append(Item)
    }
    
    //clear Items
    static func clearItems() {
        allItemList = []
        claimedItemList = []
    }
    
}
