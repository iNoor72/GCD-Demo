//
//  DetailsViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol DetailsViewDelegate {
    var artice: Article? {get set}
}

class DetailsViewPresenter: DetailsViewDelegate {
    weak var view: DetailsViewProtocol?
    var artice: Article?
    
    init(view: DetailsViewProtocol, artice: Article) {
        self.view = view
        self.artice = artice
    }
    
    
}
