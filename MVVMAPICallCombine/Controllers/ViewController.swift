//
//  ViewController.swift
//  MVVMAPICallCombine
//
//  Created by Norbert Grover on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    let tempArray = ["Floyd Schofield", "Dimitri Grover", "Major Hacket", "Lorenzo Simpson", "Tank Davis"]
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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

