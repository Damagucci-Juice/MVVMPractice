//
//  AddCoffeeOrderViewModel.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    var sizes: [String] {
        CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
