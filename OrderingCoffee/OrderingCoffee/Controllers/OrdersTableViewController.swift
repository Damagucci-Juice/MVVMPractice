//
//  OrdersTableViewController.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    private var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOrders()
    }
    
    private func fetchOrders() {
        guard let orderUrl = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { return }
        let resource = Resource<[Order]>(baseURL: orderUrl)
        WebService().load(resource: resource) { [unowned self] result in
            switch result {
            case .success(let orders):
                self.orderListViewModel.updateOrderViewModels(orders.map { OrderViewModel(order: $0) })
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension OrdersTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderListViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = orderListViewModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}
