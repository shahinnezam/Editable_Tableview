//
//  FoodList.swift
//  Editable_Tableview
//
//  Created by Student Account on 10/3/22.
//

import Foundation

struct FoodList {
    var listofFood: [Food] = []
    
    init() {
        self.listofFood.append(Food(type:"Italian", name:"Spaghetti"))
        self.listofFood.append(Food(type:"Chinese", name:"Orange Chicken"))
    }
    
    mutating func add(grub: Food) {
        self.listofFood.append(grub)
    }
    
    mutating func remove(atIndex: Int) {
        self.listofFood.remove(at:atIndex)
        }
}
