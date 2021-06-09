//
//  MainViewController+Extensions.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Noor"
        cell.detailTextLabel?.text = "Subtitile of Noor"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}
