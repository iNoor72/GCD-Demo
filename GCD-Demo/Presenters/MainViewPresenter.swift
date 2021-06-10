//
//  MainViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol MainPresenterDeleagte {
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
        let url = URL(string: Constants.apiKey)!
        if let data = try? Data(contentsOf: url){
            //Data received, parse it
            parse(data: data)
            let task = URLSession.shared.dataTask(with: url)
                task.resume()
            } else {
                print("error fetching data.")
            }
    }
    
    private func parse(data: Data) {
        var articles = [Article]()
            if let decoder = try? JSONDecoder().decode(Articles.self, from: data) {
                articles = decoder.articles
                print(articles)
        }
    }
    
    func showData() {
        view?.showData()
    }
    
    
    
}
