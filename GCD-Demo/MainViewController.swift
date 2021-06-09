//
//  ViewController.swift
//  GCD-Demo
//
//  Created by Noor Walid on 07/06/2021.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showData()
}

class MainViewController: UIViewController, MainViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var network = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        network.fetchArticles()
        
    }
    
    func showData() {
        
    }
    
    
}

