//
//  OrderListViewModel.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

struct OrderListViewModel {
    private var orderViewModels: [OrderViewModel]
    
    init(_ orderViewModels: [OrderViewModel] = []) {
        self.orderViewModels = orderViewModels
    }
}

extension OrderListViewModel {
    subscript(_ index: Int) -> OrderViewModel {
        orderViewModels[index]
    }
    
    var count: Int { orderViewModels.count }
    
    mutating func updateOrderViewModels(_ vms: [OrderViewModel]) {
        self.orderViewModels = vms
    }
    
    mutating func append(_ vm: OrderViewModel) {
        orderViewModels.append(vm)
    }
}
