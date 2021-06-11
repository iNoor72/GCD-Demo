//
//  MainViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol MainPresenterDeleagte {
    var articlesObject: Articles {get set}
    func fetchData()
    func showData()
}

class MainViewPresenter: MainPresenterDeleagte {
    
    weak var view : MainViewProtocol?
    var articlesObject: Articles = Articles(articles: [Article]())
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    func fetchData() {
        DispatchQueue(label: "FetchingData", qos: .background).async { [weak self] in
            let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-06-09&sortBy=popularity&apiKey=\(Constants.apiKey)")!
            if let data = try? Data(contentsOf: url){
                self?.parse(data: data)
                print("Data fetched and parsed correctly.")
                self?.showData()
                } else {
                    print("error fetching data.")
                }
        }
    }
    
    private func parse(data: Data) {
            if let decoder = try? JSONDecoder().decode([Article].self, from: data) {
                articlesObject.articles = decoder
                print(articlesObject)
        }
    }
    
    func showData() {
        DispatchQueue.main.async {
            self.view?.showData()
        }
    }
    
}
