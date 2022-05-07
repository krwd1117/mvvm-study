//
//  OrdersTableViewController.swift
//  CoffeeOrder
//
//  Created by Jeongwan Kim on 2022/05/06.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    // MARK: - Functions
    private func populateOrders() {
        /**
         Order에 extension으로 all을 확장 했으므로 필요 없어짐
         */
//        guard let coffeeOrders = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
//            fatalError("URL was incorrect")
//            return
//        }
        
//        let resource = Resource<[Order]>(url: coffeeOrders)
        
//        WebService().load(resource: resource) { [weak self] result in
        WebService().load(resource: Order.all) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let orders):
                self.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - UITableViewController
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}

// MARK: - AddCoffeeOrderDelegate

extension OrdersTableViewController: AddCoffeeOrderDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let naviController = segue.destination as? UINavigationController,
              let addCoffeeOrderViewController = naviController.viewControllers.first as? AddOrderViewController else {
            fatalError("Error performing segue!")
        }
        
        addCoffeeOrderViewController.delegate = self
        
    }
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true)
        let orderViewModel = OrderViewModel(order: order)
        orderListViewModel.ordersViewModel.append(orderViewModel)
        tableView.insertRows(at: [IndexPath.init(row: orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true)
    }
}
