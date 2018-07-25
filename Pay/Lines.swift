//
//  Lines.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation

class Line: NSObject {
    var s: String
    var start: String.Index
    
    init(s: String){
        self.s = s
        self.start = s.startIndex
        super.init()
    }
    
    func stringToItem(){
        var price = [Character]()
        for i in s.characters.indices {
            if(s[i] != "."){
                continue
            }
            let next = s.index(after: i)
            let next2 = s.index(after: next)
            let prev = s.index(before: i)
            let prev2 = s.index(before: prev)
            let prev3 = s.index(before: prev2)
            if(s[i] == "." && isDigit(str: s[next]) && isDigit(str: s[next2])){
                if(isDigit(str: s[prev3]) && isDigit(str: s[prev2]) && isDigit(str: s[prev])){
                    price = [s[prev3],s[prev2],s[prev],s[i], s[next], s[next2]]
                    start = prev3
                }else if(isDigit(str: s[prev2]) && isDigit(str: s[prev])){
                    price = [s[prev2],s[prev],s[i], s[next], s[next2]]
                    start = prev2
                }else if(isDigit(str: s[prev])){
                    price = [s[prev],s[i], s[next], s[next2]]
                    start = prev
                }else{
                    price = [s[i], s[next], s[next2]]
                    start = i
                }
                break
            }
        }
        if (start != s.startIndex){
            var name = [Character]()
            let end = s.index(before: start)
            for j in s.characters.indices {
                name.append(s[j])
                if (j == end) {
                    break
                }
            }
            print(String(name))
            print(Double(String(price))!)
            let newItem = Item(name: String(name), cost: Double(String(price))!)
            ItemDatabase.addItem(Item: newItem)
        }
    }
    
    func isDigit(str: Character) -> Bool{
        if(str >= "0" && str <= "9"){
            return true
        }
        return false
    }
    
}
