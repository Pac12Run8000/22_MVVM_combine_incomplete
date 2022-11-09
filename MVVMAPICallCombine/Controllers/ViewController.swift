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
    
    let tempArray = ["Floyd Schofield", "Dimitri Grover", "Major Hacket", "Lorenzo Simpson", "Tank Davis"]
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.populateTableViewWithList(input: "ol")

    }

    @IBAction func submitBtnPressed(_ sender: UIButton) {
        
        
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = tempArray[indexPath.row]
        return cell!
    }
}

