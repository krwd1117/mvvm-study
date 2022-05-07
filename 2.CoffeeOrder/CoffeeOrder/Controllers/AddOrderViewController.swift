//
//  AddOrderViewController.swift
//  CoffeeOrder
//
//  Created by Jeongwan Kim on 2022/05/06.
//

import UIKit

protocol AddCoffeeOrderDelegate: NSObject {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController {
    
    var delegate: AddCoffeeOrderDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private var coffeeSizeSegmentedControl: UISegmentedControl!
    
    private var viewModel = AddOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configure()
    }
    
    private func configure() {
        coffeeSizeSegmentedControl = UISegmentedControl(items: viewModel.sizes)
        // 다른 제약 조건을 줄 것 이므로 false 처리
        coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeSizeSegmentedControl)
        coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @IBAction func close() {
        if let delegate = delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
    }
    
    @IBAction func save() {
        let name = nameTextField.text
        let email = emailTextField.text
        let coffeeSize = coffeeSizeSegmentedControl.titleForSegment(at: coffeeSizeSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting Coffee")
        }
        
        viewModel.name = name
        viewModel.email = email
        viewModel.selectedType = viewModel.types[indexPath.row]
        viewModel.selectedSize = coffeeSize
        
        WebService().load(resource: Order.create(viewModel: viewModel)) { result in
            switch result {
            case .success(let order):
                if let order = order,
                   let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

extension AddOrderViewController: UITableViewDelegate {
    
    // 테이블 뷰에서 선택한 로우 체크 표시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    // 테이블 뷰에서 선택해제 된 로우 처리
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}

extension AddOrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddOrderTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.types[indexPath.row]
        return cell
    }
    
    
}
