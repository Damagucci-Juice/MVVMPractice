//
//  OrdersTableViewController.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOrders()
    }
    
    private func fetchOrders() {
        guard let orderUrl = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { return }
        let resource = Resource<[Order]>(baseURL: orderUrl)
        WebService().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}
