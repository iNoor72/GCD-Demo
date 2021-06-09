//
//  MainViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol MainPresenterDeleagte {
//    var delegate: MainViewPresenter {get set}
    var articles: Articles {get set}
    func fetchData()
    func showData()
}

class MainViewPresenter: MainPresenterDeleagte {
    
    weak var view : MainViewProtocol?
    var articles: Articles = Articles(articles: [Article]())
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    //var delegate: MainViewPresenter
    
    func fetchData() {
    }
    
    func showData() {
        view?.showData()
    }
    
    
    
}
