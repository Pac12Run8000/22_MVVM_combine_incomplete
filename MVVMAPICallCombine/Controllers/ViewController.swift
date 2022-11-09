//
//  ViewController.swift
//  MVVMAPICallCombine
//
//  Created by Norbert Grover on 11/8/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var cancellables:Set<AnyCancellable> = []
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupBinding()
        

    }

    @IBAction func submitBtnPressed(_ sender: UIButton) {
        viewModel.populateTableViewWithList(input: searchTextField.text)
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = viewModel.list[indexPath.row]
        return cell!
    }
}

extension ViewController {
    
    public func setupBinding() {
        viewModel.$list.sink {  _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.store(in: &cancellables)
    }
}

