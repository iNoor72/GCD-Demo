//
//  DetailsViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol DetailsViewDelegate {
    func showData()
}

class DetailsViewPresenter: DetailsViewDelegate {
    
    weak var view: DetailsViewProtocol?
    
    init(view: DetailsViewProtocol) {
        self.view = view
    }
    
    func showData() {
        view?.showData()
    }
    
    
}
