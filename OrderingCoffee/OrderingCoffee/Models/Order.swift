//
//  Order.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let size = CoffeeSize(rawValue: vm.selectedSize!.lowercased()),
              let type = CoffeeType(rawValue: vm.selectedType!.lowercased())
        else { return nil}
        self.name = name
        self.email = email
        self.size = size
        self.type = type
    }
}

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { fatalError("URL is incorrect!") }
        return Resource<[Order]>(baseURL: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { fatalError("URL is incorrect!") }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Encoding Error")
        }
        var resource = Resource<Order?>(baseURL: url)
        resource.httpMethod = .post
        resource.body = data
        return resource
    }
}
