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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    
    var delegate: DetailsViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showData() {
        titleLabel.text = delegate?.artice?.title
        publishedAtLabel.text = delegate?.artice?.publishedAt
        contentText.text = delegate?.artice?.content
    }

}
