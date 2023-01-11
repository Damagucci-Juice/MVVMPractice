//
//  OrderViewModel.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String { order.name }
    var email: String { order.email }
    var type: String { order.type.rawValue }
    var size: String { order.size.rawValue }
}
