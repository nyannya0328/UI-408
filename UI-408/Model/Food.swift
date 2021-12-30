//
//  Food.swift
//  UI-408
//
//  Created by nyannyan0328 on 2021/12/30.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var itemImage : String
    var itemTitle : String
}

var foods = [

    Food(itemImage: "Food1", itemTitle: "Yummy Chocalate Cake"),
    Food(itemImage: "Food2", itemTitle: "Delicious Pizza"),
    Food(itemImage: "Food3", itemTitle: "Yummy scrummy\ncarrot cake"),
]
