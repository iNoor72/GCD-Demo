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
    var delegate : MainPresenterDeleagte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        delegate = MainViewPresenter(view: self)
        
    }
    
    func showData() {
        
    }
    
    
}

