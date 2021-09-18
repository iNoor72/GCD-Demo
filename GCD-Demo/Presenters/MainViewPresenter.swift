//
//  MainViewPresenter.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

protocol MainPresenterDeleagte {
    var articlesObject: Articles {get}
    func fetchData()
}

class MainViewPresenter: MainPresenterDeleagte {
    
    weak var view : MainViewProtocol?
    var articlesObject: Articles = Articles(articles: [Article]())
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    //Background thread to fetch the articles from the API
    func fetchData() {
        DispatchQueue(label: "FetchingData", qos: .background).async { [weak self] in
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(Constants.apiKey)")
            if let safeURL = url {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: safeURL) { data, response, error in
                    if error != nil {
                        print("There was problem fetching data from URL. Error is: \(error?.localizedDescription)")
                    }
                    if let safeData = data {
                        let dataString = String(data: safeData, encoding: .utf8)!
                        print("Data retrieved for popular using URLSession")
                        print(dataString)
                    }
                }
                task.resume()
            }
        }
    }
    
    private func parse(data: Data) {
//            if let decoder = try? JSONDecoder().decode([Article].self, from: data) {
//                articlesObject.articles = decoder
//                print(articlesObject)
//        }
    
        do {
            try articlesObject.articles = JSONDecoder().decode([Article].self, from: data)
        } catch {
            print("There was a problem decoding the data. \(error.localizedDescription)")
        }
    }
    
}
