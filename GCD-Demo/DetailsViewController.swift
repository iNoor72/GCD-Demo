//
//  DetailsViewController.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func showData()
}

class DetailsViewController: UIViewController, DetailsViewProtocol {
    
    var delegate: DetailsViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = DetailsViewPresenter(view: self)
    }
    
    func showData() {
        
    }

}
