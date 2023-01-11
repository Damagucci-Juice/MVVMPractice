//
//  AddOrderViewController.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

final class AddOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private var segmentControl: UISegmentedControl!
    private var vm = AddCoffeeOrderViewModel()
    var delegate: AddCoffeeOrderDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
    }
    
    @IBAction func save() {
        let name = nameTextField.text
        let email = emailTextField.text
        let selectedSize = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        vm.name = name
        vm.email = email
        vm.selectedSize = selectedSize
        vm.selectedType = vm.types[indexPath.row]
        
        WebService().load(resource: Order.create(vm: vm)) { result in
            switch result {
            case .success(let order):
                if let delegate = self.delegate, let order = order {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setUP() {
        self.segmentControl = UISegmentedControl(items: vm.sizes)
        self.segmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentControl)
        
        segmentControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddOrderTableViewCell", for: indexPath)
        cell.textLabel?.text = vm.types[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
