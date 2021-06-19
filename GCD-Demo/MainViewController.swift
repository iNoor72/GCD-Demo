//
//  ViewController.swift
//  GCD-Demo
//
//  Created by Noor Walid on 07/06/2021.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showData()
    //func reloadTableViewData()
}

class MainViewController: UIViewController, MainViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate : MainPresenterDeleagte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        delegate = MainViewPresenter(view: self)
        delegate?.fetchData()
        showData()
    }
    
    func showData() {
        reloadTableViewData()
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.articlesObject.articles.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = delegate?.articlesObject.articles[indexPath.row].title
        cell.detailTextLabel?.text = delegate?.articlesObject.articles[indexPath.row].description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        destination.delegate = DetailsViewPresenter(view: destination, artice: self.delegate?.articlesObject.articles[indexPath.row] ?? Article(title: "", description: "", publishedAt: "", content: ""))
        
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}
